# staticSite

This code was develop from [The Gitbook Gasty starter](https://www.gatsbyjs.com/starters/hasura/gatsby-gitbook-starter)
Which is licensed via [MIT](https://github.com/hasura/gatsby-gitbook-starter/blob/master/LICENSE)
We are using that code as a basis and relicensing via the Apache 2 license.

To get this to run on your own machine you need.

[NodeJs](https://nodejs.org/en/download/)

You also of course need Git on your PC. [Get it here](https://git-scm.com/download/win)

Then since this is a Gatsby project you need it.
And now that you have NodeJS and Git open a Git Bash shell and enter.

```
npm install -g gatsby-cli
```

Create yourself a directory in which to clone this repository.
And clone it.

Change to the directory into which it is cloned. And enter 

```
npm install
```
This will install the node modules needed  
Note I also ran this on another machine and had some issues.  
If you have problems delete the file package-lock.json and try again.  

Looks like deleting the package-lock.json file will be required anyway.
So I have deleted it.

Then enter

```
gatsby develop
```

Then the example site will be avaiable via 

[your local host](http://localhost:8000/)


# To add content

Open a second Git Bash window and navigate to where you cloned the repository.

Open your favourite editor. I hope it is Visual Studio Code since it is easier.

If you have it just enter
```
code .
```

In the site's directory.

Then look at the files in the content directory. And its subdirectories.
They are mdx files. That is Markdown with some extensions.

To create new content on the left hand side menu of the site add a new file directly under content.  
Copy one and edit may be easier.
To create a sub level in the menu on the left hand side create a folder with the same name as the file.  
Then create mdx files in the folder.

The entries on the right hand side menu are generated from the header level 1 (#) entries in your markdown.

The site is pretty close to being auto updateable. I messed something up and it may not be for you.
So Ctrl C will stop your serve.
Then up arrow and re run 
```
gatsby develop
```

Then you can refresh your web page.
It should be auto updating but I broke something somewhere. Will fix it soon.

To read more about how to do stuff read the docs at  [Gatsby](https://www.gatsbyjs.com/docs/)

I've not tried deploying the site yet. Wanted some buy in before trying that.

And of cource the colours and fonts and detailed layout are all still up for grabs.
