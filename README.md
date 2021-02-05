# Parser

Test app for SP: log files parser.
Parses a log file and returns information regarding total visits and unique visits count.

## Installation

Install gem directly:

```
gem install log_aggregator
```

Or add it to Gemfile:

```
gem 'log_aggregator'
```

This Parser app uses ruby 2.6.
Steps to install:
  * git clone https://github.com/natonnelier/ruby_app.git
  * cd ruby_app && bundle install

## Usage

Require library:

```
require 'parser'
```

Parse file and get number of visits:

```
Parser::Client.parse(log_file_path)
```

Add :uniq option to get number of uniq visits:

```
Parser::Client.parse(log_file_path, unique: true)
```

Add :average option to get average of visits:

```
Parser::Client.parse(log_file_path, average: true)
```

### Using rake tasks
#### List pages with most views in descending order:
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

#### List pages with most unique page views in descending order:
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