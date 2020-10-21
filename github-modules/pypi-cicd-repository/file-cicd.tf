
resource "github_repository_file" "cicd" {
  repository = github_repository.repo.name
  branch     = "main"
  file       = ".github/workflows/cicd-pipeline.yml"
  content    = <<EOT
    
on:
  push:
    branches:
      - release/*

name: CI CD Release Pipeline

jobs:
  build:
    name: CI CD Release Pipeline
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
      - name: Set Version Tag
        run: echo RELEASE_VERSION=$${GITHUB_REF/"refs/heads/release/"/} >> $GITHUB_ENV
      - name: Create Release
        id: create_release
        uses: actions/create-release@v1
        env:
          GITHUB_TOKEN: $${{ secrets.GITHUB_TOKEN }} # This token is provided by Actions, you do not need to create your own token
        with:
          tag_name: $${{ env.RELEASE_VERSION }}
          release_name: Release Version $${{ env.RELEASE_VERSION }}
          body: |
            See change log in the documentation.
          draft: false
          prerelease: true
      - name: Set up Python 3.7
        uses: actions/setup-python@v1
        with:
          python-version: 3.7
      - name: Create dist/
        run: >-
          python setup.py sdist
      - name: Publish a Python distribution to PyPI
        uses: pypa/gh-action-pypi-publish@master
        with:
          user: __token__
          password: $${{ secrets.pypi_token }}
      - name: Delete Release Branch
        run: git push origin --delete $${GITHUB_REF}
          

EOT
}
