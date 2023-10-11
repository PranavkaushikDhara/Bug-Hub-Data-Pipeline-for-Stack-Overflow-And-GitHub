# edgedb-github
This code pulls the data from different repositories and places it in edgedb.

Install edgedb on your System.
Clone the project and run "edgedb project init" command in the terminal from this directory.
Run "edgedb migration create" and "edgedb migrate" commands.
Add your GitHub Username and API token in the "headers" dictionary in the ipynb file. 
Run the ipynb file by adding the repositories and owners of your repos to the "owner_repos" dictionary in the ipynb file.
You can check the data in the edgedb by entering command "edgedb ui" from the directory.
