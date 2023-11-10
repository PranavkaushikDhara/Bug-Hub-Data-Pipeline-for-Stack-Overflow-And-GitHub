# edgedb-github
This code pulls the data from different repositories and places it in edgedb.<br>

Designed and implemented a data pipeline to create a Knowledge Graph from 10+ GitHub repositories and 200,000 StackOverflow posts, replicating the StackOverflow database model in Edgedb and inserting over 200k posts.

Install edgedb on your System.<br>
Clone the project and run "edgedb project init" command in the terminal from this directory.<br>
Run "edgedb migration create" and "edgedb migrate" commands.<br>
Add your GitHub Username and API token in the "headers" dictionary in the ipynb file. <br>
Run the ipynb file by adding the repositories and owners of your repos to the "owner_repos" dictionary in the ipynb file.<br>
You can check the data in the edgedb by entering command "edgedb ui" from the directory.<br>
