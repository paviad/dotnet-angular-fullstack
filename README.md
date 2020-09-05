# What is this?

First of all, this is a work in progress, it is messy and unclean, but it works and strives to follow best practices.

Secondly, this is a Visual Studio 2019 (version 16.8) solution which includes the following projects:
1. Auth2 - A web app project built around IdentityServer4 implementing OAuth2.0 with support for local and external logins
2. Web - A frontend web app project based on Angular
3. Api - A backend API web app project

## Auth2

This project is a .NET 5 project using IdentityServer4 (version 4.1.1) which implements OAuth2.0 with users in a local database, as well as supporting external login (e.g. Google)

## Web

This is an .NET 5 project which wraps an Angular 11 app. **Server-side rendering is fully supported with server state transfer.**

## Api

This is just a banal API, just for demonstration purposes.

# Database Creation

There is a file in the root called `database.sql` which includes a database creation script along with data insert statements. There is some
unneeded leftover data there from past tests, but most of it is used.
