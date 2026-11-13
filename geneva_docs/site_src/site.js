(function () {
  'use strict';

  var body = document.body;
  var root = body.getAttribute('data-root') || '';
  var current = body.getAttribute('data-page') || '';
  var sidebar = document.getElementById('sidebar');
  var nav = window.NAV || [];

  function make(tag, className, text) {
    var e = document.createElement(tag);
    if (className) { e.className = className; }
    if (text !== undefined && text !== null) { e.textContent = text; }
    return e;
  }

  /* ---------------- sidebar tree ---------------- */

  function containsCurrent(n) {
    if (n.u === current) { return true; }
    if (n.c) {
      for (var i = 0; i < n.c.length; i++) {
        if (containsCurrent(n.c[i])) { return true; }
      }
    }
    return false;
  }

  function link(n) {
    var a = make('a', null, n.t);
    a.href = root + n.u;
    if (n.u === current) {
      a.className = 'current';
      a.setAttribute('aria-current', 'page');
    }
    return a;
  }

  function buildList(nodes) {
    var ul = make('ul');
    nodes.forEach(function (n) {
      var li = make('li');
      li.setAttribute('data-title', n.t.toLowerCase());
      if (n.c) {
        var d = make('details');
        var s = make('summary');
        s.appendChild(link(n));
        d.appendChild(s);
        d.appendChild(buildList(n.c));
        var open = containsCurrent(n);
        d.open = open;
        d.setAttribute('data-default', open ? '1' : '0');
        li.appendChild(d);
      } else {
        li.appendChild(link(n));
      }
      ul.appendChild(li);
    });
    return ul;
  }

  function filterList(ul, q) {
    var any = false;
    Array.prototype.forEach.call(ul.children, function (li) {
      var det = li.firstElementChild && li.firstElementChild.tagName === 'DETAILS' ? li.firstElementChild : null;
      var self = li.getAttribute('data-title').indexOf(q) !== -1;
      var childVisible = false;
      if (det) {
        childVisible = filterList(det.lastElementChild, self ? '' : q);
      }
      var visible = q === '' || self || childVisible;
      li.hidden = !visible;
      if (det) {
        det.open = q === '' ? det.getAttribute('data-default') === '1' : (self || childVisible);
      }
      if (visible) { any = true; }
    });
    return any;
  }

  if (sidebar) {
    var filter = make('input', 'navfilter');
    filter.type = 'search';
    filter.placeholder = 'Filter the navigation';
    filter.setAttribute('aria-label', 'Filter the navigation tree');
    sidebar.appendChild(filter);
    var tree = buildList(nav);
    sidebar.appendChild(tree);
    filter.addEventListener('input', function () {
      filterList(tree, filter.value.trim().toLowerCase());
    });
    var cur = sidebar.querySelector('a.current');
    if (cur && cur.scrollIntoView) { cur.scrollIntoView({ block: 'center' }); }
  }

  var menuBtn = document.getElementById('menu-toggle');
  if (menuBtn) {
    menuBtn.addEventListener('click', function () {
      var open = body.classList.toggle('nav-open');
      menuBtn.setAttribute('aria-expanded', open ? 'true' : 'false');
    });
  }

  /* ---------------- search ---------------- */

  var input = document.getElementById('q');
  var results = document.getElementById('results');
  var data = null;
  var loading = false;

  function loadIndex(cb) {
    if (data) { cb(); return; }
    if (loading) { return; }
    loading = true;
    var s = document.createElement('script');
    s.src = root + 'assets/search-index.js';
    s.onload = function () { data = window.SEARCH || []; loading = false; cb(); };
    s.onerror = function () { loading = false; };
    document.head.appendChild(s);
  }

  function search(q) {
    var terms = q.toLowerCase().split(/\s+/).filter(Boolean);
    if (!terms.length) { return []; }
    var out = [];
    data.forEach(function (p) {
      if (!p._l) {
        p._l = { t: p.t.toLowerCase(), h: p.h.toLowerCase(), x: p.x.toLowerCase() };
      }
      var score = 0;
      for (var i = 0; i < terms.length; i++) {
        var inT = p._l.t.indexOf(terms[i]) !== -1;
        var inH = p._l.h.indexOf(terms[i]) !== -1;
        var inX = p._l.x.indexOf(terms[i]) !== -1;
        if (!(inT || inH || inX)) { return; }
        score += (inT ? 10 : 0) + (inH ? 4 : 0) + (inX ? 1 : 0);
      }
      out.push({ p: p, score: score, term: terms[0] });
    });
    out.sort(function (a, b) { return b.score - a.score || a.p.t.localeCompare(b.p.t); });
    return out.slice(0, 20);
  }

  function snippet(p, term) {
    var i = p._l.x.indexOf(term);
    if (i < 0) { return ''; }
    var start = Math.max(0, i - 60);
    return (start > 0 ? '\u2026' : '') + p.x.substr(start, 150) + '\u2026';
  }

  function render(list) {
    results.textContent = '';
    if (!list.length) {
      results.appendChild(make('li', 'r-none', 'No matching pages.'));
    }
    list.forEach(function (r) {
      var li = make('li');
      var a = make('a');
      a.href = root + r.p.u;
      a.appendChild(make('div', 'r-title', r.p.t));
      a.appendChild(make('div', 'r-path', r.p.s));
      var sn = snippet(r.p, r.term);
      if (sn) { a.appendChild(make('div', 'r-snip', sn)); }
      li.appendChild(a);
      results.appendChild(li);
    });
    results.hidden = false;
  }

  if (input && results) {
    input.addEventListener('focus', function () { loadIndex(function () {}); });
    input.addEventListener('input', function () {
      var q = input.value.trim();
      if (q.length < 2) { results.hidden = true; return; }
      loadIndex(function () { render(search(q)); });
    });
    input.addEventListener('keydown', function (e) {
      if (e.key === 'Escape') { results.hidden = true; }
      if (e.key === 'Enter') {
        var first = results.querySelector('a');
        if (first) { window.location.href = first.href; }
      }
      if (e.key === 'ArrowDown') {
        var f = results.querySelector('a');
        if (f) { e.preventDefault(); f.focus(); }
      }
    });
    results.addEventListener('keydown', function (e) {
      var t = e.target;
      var li = t.closest ? t.closest('li') : null;
      if (!li) { return; }
      var next = e.key === 'ArrowDown' ? li.nextElementSibling : e.key === 'ArrowUp' ? li.previousElementSibling : null;
      if (next) { e.preventDefault(); next.querySelector('a').focus(); }
      else if (e.key === 'ArrowUp') { e.preventDefault(); input.focus(); }
    });
    document.addEventListener('click', function (e) {
      if (!results.contains(e.target) && e.target !== input) { results.hidden = true; }
    });
  }
})();
