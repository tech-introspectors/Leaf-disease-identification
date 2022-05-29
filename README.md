<h1 align = "center">Leaf Disease Identification</h1>

<p align="center">

<img src= "https://github.com/Dantusaikamal/Leaf-disease-identification/blob/main/assets/images/icon-leaf.png" width="150px" />

</p>

<p align="center">
  <img src="https://img.shields.io/github/v/release/Dantusaikamal/Leaf-disease-identification?include_prereleases">
  <img src="https://img.shields.io/github/last-commit/Dantusaikamal/Leaf-disease-identification">
  <img src="https://img.shields.io/github/issues-raw/Dantusaikamal/Leaf-disease-identification">
  <img src="https://img.shields.io/github/issues-pr/Dantusaikamal/Leaf-disease-identification">
  <img src="https://img.shields.io/badge/License-MIT-green.svg">
</p>


Agriculture is the primary source of livelihood for about 58 per cent of India’s population. Gross Value Added by agriculture, forestry and fishing is estimated at Rs 18.55 lakh crore (US$ 265.51 billion) in FY19(PE).  

Apart from being an industry, agriculture is the main source of income for about 70 million farmers in India. Undoubtedly, Agriculture is crucial to Indian economy. What's more important, is that Indian farmers are feeding 1.4 billion people, which is one-fifth of the total world population. 

However, Indian agriculture is threatened by pests that can ruin their crops and their livelihoods.

According to a study by the Associated Chambers of Commerce and Industry of India, annual crop losses due to pests and diseases amount to Rs.50,000 crore ($500 billion), which is significant in a country where at least 200 million Indians go to bed hungry every night.

With so many tonnes of crops being destroyed every year due to pests and diseases, it is important to find a solution and implement it to avoid any more waste of crops due to diseases and pest infections.  Which is why, we have come up with our solution which aims to reduce crop destruction by pests. In this way, we can feed atleast a portiion of the 200 millions who go to bed every night!

If 30% of crops produced in India are being affected by dieseases, imagine the global scenario. We believe, our Leaf Disease Identification project can tackle various problems such us Global Hunger, Responsible Production, and more.

## Our Solution: 
We have developed a mobile application using Flutter that uses Machine Learning to identify more than 35 common diseases in crops. 

The Machine Learning model is trained with over 6.5 Lakh images and has an accuracy of 97.53%

The mobile application is very easy to use. The farmer will first capture an image of an infected leaf or can also select an image from their mobile storage. Next, the leaf image will be analyzed by our Machine learning model, which will predict the leaf disease instantly. The application will predict the disease name, and will also provide the causes and possible solutions to counter the disease.

The application is divided into different modules:

#### 1. Home Screen: 

The home screen contains simple instructions on how to use the application to identify leaf diseases. It also stores and displays past history of identified leaf diseases.

<p align="center">
<img src= "https://github.com/Dantusaikamal/Leaf-disease-identification/blob/main/screenshots/posters/Home%20screen.png" width="600" >
</p>

#### 2. Navigation Screen: 

The Navigation screen contains options for the farmer to translate the application into a language of their own choice. The farmer can capture an image of a plant or select an image from their storage to know the condition of their plant.

<p align="center">
<img src= "https://github.com/Dantusaikamal/Leaf-disease-identification/blob/main/screenshots/posters/Navigation%20screen.png" width="600">
</p>

#### 3. Language translation Screen: 

The Language translation screen will allow the farmer to use the application in whatever language they are comfortable with.

<p align="center">
<img src= "https://github.com/Dantusaikamal/Leaf-disease-identification/blob/main/screenshots/posters/Language%20translation%20screen.png" width="600"> 
</p>

#### 4. Suggestions Screen: 

The Suggestions screen is the main screen which returns the name of the disease affecting the crop. It will also return possible causes and solution for the particular disease. 

<p align="center">
<img src= "https://github.com/Dantusaikamal/Leaf-disease-identification/blob/main/screenshots/posters/Suggestions%20screen.png" width="600">
</p>
Apart from being accurate in predicting leaf disease and their solutions, one more particular feature that makes our application stand out from other similar applications is that our application has a language translation module. It is important to remember that if a mobile application is available only in English, then a farmer might not be able to use the application easily.

That is why we have developed a language translation module that will translate our application into 15 widely spoken languages in India. We will soon expand it to 22 languages that are commonly spoken in India. This will make our application more accessible for the farmers. 

# Demo-Preview




https://user-images.githubusercontent.com/65682028/162416027-6ecd288c-de58-4f3b-809f-a2f2c6ab8381.mp4


# Table of contents

Here is the TOC this project.

- [Demo-Preview](#demo-preview)
- [Table of contents](#table-of-contents)
- [Installation](#installation)
- [Usage](#usage)
- [Development](#development)
- [Contribute](#contribute)
    - [Sponsor](#sponsor)
    - [Adding new features or fixing bugs](#adding-new-features-or-fixing-bugs)
- [License](#license)

# Implementation
[(Back to top)](#table-of-contents)

We have built a mobile application that is integrated with a robust machine learning model that is trained with a very large dataset.

The mobile application allows a farmer to capture an image of an infected leaf and select an image from device storage. The application will then predict the disease affecting the crop and will also provide the solution to that disease.

In this way, a farmer can detect a plant disease very easily. 

To predict the solution, we have integrated a well trained Machine Learning model into our application which stands with an accuracy of 97.53%.

Talking about the technologies that we have used to build the product, we have used multiple technologies to develop our project. 

Firstly, we developed our mobile application using flutter. We have used flutter to develop cross-platform mobile applications.

Next, we have used Tensorflow to develop a robust Machine learning model with an accuracy of 97.53% and trained it with over 6,55,000 images and used Keras to create a layered neural network to distinguish over 30 types of common plant diseases.

# Usage
[(Back to top)](#table-of-contents)


If we help to identify pests and diseases in their early stages, a farmer can take necessary actions to save their crop. This will contribute in feeding atleast a portion of the 200 million Indians who go to bed hungry every night.

We are looking to use Technology to tackle challenges in Agriculture. And we believe, our Leaf disease identification mobile application is going to play a crucial role in revolutionizing farming in India.  



## Getting started

In order to get started with the application, fork the repository and create a local workspace.

Install Flutter SDK, Android Studio

Set the environment variables if necessary

### Installation

1. Clone the repo
```sh
git clone https://github.com/Dantusaikamal/Leaf-disease-identification.git
```
2. Install Flutter packages
```sh
flutter pub get
```

# Development
[(Back to top)](#table-of-contents)

We have created a mobile application in which we need to capture an image of an infected leaf. And it will predict the disease affecting the crop and will also provide the solution to that disease.

In this way, a farmer can detect a plant disease very easily. 

In order to predict the solution, we have integrated a well trained Machine Learning model into our application which stands with an accuracy of 97.53%.

Talking about the technologies that we have used to build the product, we have used multiple technologies to develop our project. 

Firstly, we developed our mobile application using flutter. We have used flutter because we can develop cross platform mobile applications.

Next, we have used Tensorflow to develop a robust Machine learning model with an accuracy of 97.53% and trained it with over 6,55,000 images and used keras to create a layered neural network to distinguish over 30 types of common plant diseases.


# Contribute
[(Back to top)](#table-of-contents)

Please check Contribute.md to know how you can contribute to this project.

### Sponsor
[(Back to top)](#table-of-contents)

If you want to sponsor the project, please donate your money to any relief funds for COVID-19 like [WHO Relief fund](https://www.who.int/emergencies/diseases/novel-coronavirus-2019/donate) or the organizations in your own country like [PM cares fund](https://www.pmcares.gov.in/en/)


### Adding new features or fixing bugs
[(Back to top)](#table-of-contents)

If you find an issue in the project, open a new issue or a raise a pull request in this repository. 

You can also mail to dantusaikamal@gmail.com incase of any issues.

# License
[(Back to top)](#table-of-contents)

Check out the LICENSE file in the repo.

[GNU General Public License version 3](https://opensource.org/licenses/GPL-3.0)



