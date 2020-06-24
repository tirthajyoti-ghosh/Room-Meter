# Room Meter - RoR Capstone Project

Room Meter is a hotel review site where users can create reviews in forms of articles and vote other reviews. The articles are divided in categories where one category can have many articles and one article can have many categories. It's built with Ruby on Rails framework by following the MVP pattern.

![room-meter](https://user-images.githubusercontent.com/57726348/84763031-3b93bc80-afe9-11ea-9b06-7bc0ad429b6a.png)

## What it does

Its a hotel review articles site similar to any blog site.

*As a guest user:*

- You will be able to create account/log in.
- You can see only “Log in” and “Sign up” page.

*As a logged-in user:*

- Homepage
  - Featured article with full-width image and title in the first row. This article has the biggest number of votes.
  - List of all categories in order of priority. Each category is displayed as a square with its name on the top and its most recent article's title in the bottom. The background image is the image of the most recent article in this category.

- Category show page
  - Articles are sorted by most recent.
  - Each article displays: image, title, truncated text as preview and its **author name**.
  - A vote button for article (you can vote only once).

- Write an article page
  - A form with all necessary fields is displayed.

## Built With

- Ruby v2.6.5
- Ruby on Rails v6.0.3.1

*Gems used:*

- Devise (for user authentication)
- Faker
- Validate URL (for validating image URL)
- Gems used for testing:
  - Capybara
  - Selenium webdriver
  - Chromedriver helper
  - Database cleaner
  - Rspec-rails
  - Shoulda matchers

- Rubocop

## Live Demo

[Live Demo Link](https://gentle-bastion-08051.herokuapp.com/)

## Video Presentation

[Video Presentation](https://www.loom.com/share/586608a918e345468ab5ce2efecadd49)

## Getting Started

To get a local copy up, clone it and running follow these simple example steps.

### Prerequisites

- Ruby: 2.6.5
- Rails: 6.0.3.1
- Postgres: >= 9.5

### Setup

Install gems with:

``` bash
bundle install
```

Setup database with:

``` bash
   rails db:create
   rails db:migrate
```

Create users with:

``` bash
   rails db:seed
   Login with email: 'example-{add a number between 1-15}@microverse.org', and password:'password'
```

### Usage

Start server with:

``` bash
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

``` bash
    rpsec
```

### Deployment

- App deployed in Heroku.

### For future releases

- Add comments section to articles
- Create an article show page
- Create a rating system
- A search feature to search reviews

## Author

👤 **Tirthajyoti Ghosh**

- Github: [@Tirthajyoti Ghosh](https://github.com/tirthajyoti-ghosh)
- Twitter: [@terrific_ghosh](https://twitter.com/terrific_ghosh)
- Linkedin: [Tirthajyoti Ghosh](https://www.linkedin.com/in/tirthajyoti-ghosh/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome! Start by:

- Forking the project.
- Cloning the project to your local machine.
- cd into the project directory.
- Run git checkout -b your-branch-name.
- Make your contributions.
- Push your branch up to your forked repository.
- Open a Pull Request with a detailed description to the development branch of the original project for a review.

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse
- Stackoverflow
- Freepik
- Unsplash
- Site Design [Behance](https://www.behance.net/gallery/14554909/liFEsTlye-Mobile-version)
- Login/Signup page design [Codepen](https://codepen.io/FilipVitas/full/xxbBqYN)

## 📝 License

No license.
