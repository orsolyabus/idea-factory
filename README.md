# Idea Factory

Build a web app to post & discuss ideas with Rails.

Assignment to be done Hackaton style in 10 hours max.

## Part 1: CRUD

* Implement full CRUD for ideas (not fully shown in the wireframe above)
 New, Create, Show, Index, Delete, Edit & Update
* Each idea has a title and a description.
* Make sure that there are 6 specs added:
 2 for the New action
 4 for the Create action
## Part 2: User Authentication

* Implement basic user authentication:
Sign Up
Sign In
Sign Out
* Associate created ideas with current user.
* Allow only the creator to edit & delete their ideas.
## Part 3: Reviews

* Implement the ability for users to put reviews on each idea's show page
* User must be signed in in order to create a review and the created ideas get associated with the signed in user
* The user who created the review should be able to delete the review
## Part 3: Interactivity

* In the ideas#index, only display the title at first.
* Add a + icon (with a picture or Font Awesome) to the left of the title.
* Clicking the + icon should show the description of the idea and change the icon to a – icon.
* Clicking the – icon should make the description disappear.
