# README

## Directions to Get Set Up

Getting your team ready to collaborate on the project will require the following steps:

### Create an Organization for Your Group

One team member should create an **organization** for your group:

![Creating Org](images/create_org.png)

Select the free tier. Give the organization a name. We recommend selecting the "My personal account" option for the "The organization belongs to" question.

Add the other users in the group.

![Adding org users](images/add_org_users.png)

Turn on Personal Access Token support by visiting this link in the Settings link for the organization:


![enable PAT](images/org_pat1.png)

Once there start by clicking continue for step 1. For step two, allow tokens to work immediately:

![enable PAT](images/org_pat2.png)

Click continue and finally enroll.

### Create a Private Repository for Your Group

Once team members join the organization, one team member should create a repository:

![Creating Repository](images/create_repo.png)

Here are the options (you can select a different name). Make sure you make the organization the owner.

![Repository Options](images/create_options.png)

Select the "Private" option.

Do not add a `README`, `.gitignore`, or license file (these will come later).

For the moment, leave the repository empty (i.e., do not follow the directions for how to commit your first files that you will be shown).

Once the repository is created, make sure all users in the organization have access:

![Manage roles](images/repo_manage_roles.png)

Give all members the base access level of "Read and Write". Click ok for the warning GitHub gives you.

Repository is now ready to be linked in Posit Cloud.

### Creating a Personal Access Token

GitHub's Personal Access Tokens function similarly to passwords for an account but they can be limited to certain repositories and have an expiration date. One user can have more than one PAT, so they can also be easily revoked if they become compromised without having to freeze the entire account.

Each team member will need to create a PAT with permissions to view and edit the shared repository.

To do so, go to you user icon and select Settings

![User settings](images/settings.png)


On the left hand side of the screen, select "Developer Settings".

![Dev settings](images/dev_settings.png)

Then select "Personal Access Token" and "Fine-grained Tokens". Then "Generate New Token".

On the next screen, select your token name and expiration length. For the resource owner, you should see organization who invited collaborators. Under "Repository Access", select "All repositories".


![Generate Token](images/gen_token.png)


Under "Permissions", select the "Repository" section. Scroll down to find "Contents" and set this to the "Read and Write" option. Scroll to the bottom and generate your token.

![Contents RW](images/contents_rw.png)


Copy the token and store it somewhere safe. If you use a password manager for your web browser, you can store it there. We will copy it to posit cloud shortly, so you will not need to access it frequently, but you may need it later. After you close this page, you will not be able to retrieve it from github.


### Creating Posit Cloud Projects

Each team member should create a new Posit Cloud project in the Stats 306 workspace.

In your Terminal tab, run the following commands:

```
rm project.Rproj
git init .
git config user.name "Your Name"
git config user.email "Your Email Address"
git config credential.helper store
```

Go to GitHub and retrieve the `https://github.com/...` version of the URL to your repository.
  
![Copy HTTPS](images/https_copy.png)


Back in the terminal in Posit Cloud run the following commands:

```
git remote add origin HTTPS_URL
git remote add upstream https://github.com/Stats-306-Fredrickson/stats306_100_wn24_project_2.git
```

Where `HTTPS_URL` is the URL you copied from GitHub.

Designate one team member to do the following:

```
git pull upstream main
git branch -m main
git push origin main
```

During this process, the user will be prompted for a user name (this is your **GitHub username**, not your email) and your password. For the password, copy and paste in your PAT. You will not see the password, but after you paste it in, press enter.

This will bring the Project 2 materials into the shared team repository on GitHub

Now all members can run the following:

```
git branch -M main
git pull --set-upstream origin main
```

They will not get copies of the shared repository. Later, after adding and committing changes, you can use

```
git pull origin main
git push origin main
```

to retrieve and share your changes.

## Project Abstract

This project analyzed and visualized the data from the IMDB. We initially tidied the data by registering "\N" as an NA value in the datasets.
We then began basic exploratory analysis on the 4 tables - title_basics, title_principals, title_ratings, and name_basics. This was achieved by finding summaries and distributions of various columns in each table and plotting them. Basic data manipulation functions, such as "mutate", "summarize", and "group_by" as well as the "ggplot" library were utilized for this section.
We analyzed the title_basics table more in-depth in terms of its "genres" column. The column was expanded using the "pivot_longer" and "separate_rows" functions in order to visualize how genre proportions of titles varied over time. "pivot_wider" and "cor" were then used to separate each genre into its own column and find the most common genre pairing.
The tables were merged in various groupings to analyze the relationships between them. title_basics and title_ratings were joined to determine the average ratings of each genre and plot their trends. name_basics, title_ratings, and title_principals were then all joined to find the most highly rated people in the dataset, the proportions of genres for titles that they were included in, and to visualize their ratings over time. This allowed us to understand the trends of ratings over time for popular people and titles in the dataset.
We continued to experiment with optimizing previous code using parallel processing and profiling.
Lastly, we created Shiny applications for users to interact with the IMDB data. 

## Team

Lynn Lam is a senior in the School of Information minoring in Statistics. I will be graduating after 5 years of university after next winter. I enjoy being a coffee snob, playing video games (Baldur's Gate 3 right now!), and watching horror movies.

Shuxian Chen is a senior who majoring in Statistics & Data Science. I enjoy reading novels and playing video games.

Katherine Zhao is a junior studying Pharmaceutical Sciences with a minor in Statistics. I enjoy dancing, playing the violin, and matching odd patterns together to create cohesively-uncohesive outfits.

Tilmont "Tilly" Williams is a sophomore majoring in Statistics and minoring in German Studies. I enjoy running, knitting, and rock climbing. 
