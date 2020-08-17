# Parser

Test app for SP: log files parser.
Parses a log file and returns information regarding total visits and unique visits count.

## Installation

This Parser app uses ruby 2.6.
Steps to install:
  * git clone https://github.com/natonnelier/ruby_app.git
  * cd ruby_app && bundle install

## Usage

### List pages with most views in descending order:
```shell
rake parse:visits webserver.log #or my-file-path.log
```

Prints:
```
/about/2 90 visits
/contact 89 visits
/index 82 visits
/about 81 visits
/help_page/1 80 visits
/home 78 visits
```

### List pages with most unique page views in descending order:
```shell
rake parse:unique webserver.log #or my-file-path.log
```

Prints:
```
/help_page/1 23 unique views
/contact 23 unique views
/home 23 unique views
/index 23 unique views
/about/2 22 unique views
/about 21 unique views
```

### To run tests:
```shell
rspec spec
```
or
```shell
bundle exec rspec spec
```
or
```shell
rake spec
```