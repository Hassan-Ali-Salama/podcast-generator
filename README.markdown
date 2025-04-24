# Podcast Feed Generator

A GitHub Action to generate a podcast feed from a YAML file. YAML is much easier to read and write than XML, and this Action will convert your YAML file into a valid podcast feed.

## Usage

### 1. Turn on GitHub Pages
To make your podcast feed accessible, you need to enable GitHub Pages for your repository. Follow these steps:

- Go to your repository on GitHub.
- Navigate to **Settings > Pages**.
- Under "Source", select the `main` branch.
- Save the settings. This will generate a GitHub Pages URL for your repository.
- Note the URL (e.g., `https://hassan-ali-salama.github.io/podcast-generator/`) as you will need it for the YAML file.

### 2. Create a YAML File
Create a file named `feed.yml` (or any name you prefer) in your repository with the following structure:

```yaml
title: "My Podcast"
subtitle: "A Podcast About Technology"
author: "Hassan Ali Salama"
description: "This podcast explores the latest trends in technology and innovation."
link: "<GitHub Pages URL>"
image: "<Artwork Location>"
language: "en-us"
category: "Technology"  # See: https://podcasters.apple.com/support/1691-apple-podcasts-categories
format: "audio/mpeg"
item:
  - title: "Episode 1: Introduction to Tech"
    description: "An introduction to the world of technology."
    published: "Thu, 12 Jan 2023 18:00:00 GMT"
    file: "/audio/TFIT01.mp3"
    duration: "00:00:36"
    length: "576324"  # File size in bytes (Get Info on your files)
  # Add more episodes as needed
```

#### YAML Fields Explanation:
- `title`: The title of your podcast.
- `subtitle`: A short subtitle for your podcast.
- `author`: The name of the podcast creator.
- `description`: A brief description of your podcast.
- `link`: The GitHub Pages URL generated in Step 1.
- `image`: URL or path to the podcast artwork.
- `language`: The language of the podcast (e.g., `en-us` for English).
- `category`: The podcast category (e.g., `Technology`).
- `format`: The format of the audio files (e.g., `audio/mpeg` for MP3 files).
- `item`: A list of episodes, where each episode includes:
  - `title`: Episode title.
  - `description`: Episode description.
  - `published`: Publication date in RFC 2822 format (e.g., `Thu, 12 Jan 2023 18:00:00 GMT`).
  - `file`: Path to the episode file (e.g., `/audio/TFIT01.mp3`).
  - `duration`: Episode duration (e.g., `00:00:36`).
  - `length`: File size in bytes (e.g., `576324`).

### 3. Set Up a Workflow
Create a workflow file in your repository to run the Action. Here's a sample workflow:

- Create a file named `.github/workflows/generate-feed.yml` in your repository.
- Add the following content:

```yaml
name: Generate Feed
on: [push]
jobs:
  generate-feed:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repo
        uses: actions/checkout@v3
      - name: Run Feed Generator
        uses: Hassan-Ali-Salama/podcast-generator@main
```

#### Workflow Explanation:
- `on: [push]`: The workflow runs whenever you push changes to the repository.
- `runs-on: ubuntu-latest`: The workflow runs on an Ubuntu runner.
- `steps`:
  - `Checkout Repo`: Checks out your repository using `actions/checkout@v3`.
  - `Run Feed Generator`: Runs your Action (`Hassan-Ali-Salama/podcast-generator@main`) to generate the podcast feed.

## Output
After the workflow runs, the Action will:
- Read the YAML file (e.g., `feed.yml`).
- Generate a podcast feed file (e.g., `podcast.xml`).
- Commit and push the generated file to your repository.

You can then access the feed at your GitHub Pages URL (e.g., `https://hassan-ali-salama.github.io/podcast-generator/podcast.xml`).