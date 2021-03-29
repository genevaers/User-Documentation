const config = {
  gatsby: {
    pathPrefix: '/',
    siteUrl: 'https://github.geneva.io',
    gaTrackingId: null,
    trailingSlash: false,
  },
  header: {
    logo: 'images/GenevaERS48.png',
    logoLink: 'https://genevaers.org/',
    title:
      "<a href='https://genevaers.org/'>GenevaERS</a>",
    githubUrl: 'https://github.com/genevaers/gatsby-gitbook-boilerplate',
    helpUrl: '',
    tweetText: '',
    social: '',
    links: [{ text: '', link: '' }],
    search: {
      enabled: false,
      indexName: '',
      algoliaAppId: process.env.GATSBY_ALGOLIA_APP_ID,
      algoliaSearchKey: process.env.GATSBY_ALGOLIA_SEARCH_KEY,
      algoliaAdminKey: process.env.ALGOLIA_ADMIN_KEY,
    },
  },
  sidebar: {
    forcedNavOrder: [
      '/genevaERS',
      '/workbench',
      '/runcontrol',
      '/performanceEngine',
      '/testFramework'
    ],
    collapsedNav: [
      '/genevaERS', // add trailing slash if enabled above
      '/workbench',
      '/workbench/details'
    ],
    links: [{ text: 'GenevaERS', link: 'https://genevaers.org' }],
    frontline: false,
    ignoreIndex: true,
    title: null
  },
  siteMetadata: {
    title: 'Gatsby GenevaERS',
    description: 'GenevaERS - the single pass engine ',
    ogImage: null,
    docsLocation: 'https://github.com/genevaers/gatsby-gitbook-boilerplate/tree/master/content',
    favicon: '',
  },
  pwa: {
    enabled: false, // disabling this will also remove the existing service worker.
    manifest: {
      name: 'Gatsby Gitbook Starter',
      short_name: 'GitbookStarter',
      start_url: '/',
      background_color: '#6b37bf',
      theme_color: '#6b37bf',
      display: 'standalone',
      crossOrigin: 'use-credentials',
      icons: [
        {
          src: 'src/pwa-512.png',
          sizes: `512x512`,
          type: `image/png`,
        },
      ],
    },
  },
};

module.exports = config;
