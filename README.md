# Running the script

To generate the receipt list based on some input will need to pass an input file path, e.g. given an `input1` file with the following content:


```
Input 1:
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
```

Run `execute.rb` passing the file path as an argument.

For example:

```
$ ruby execute.rb input1                                                                                            INT
Input 1:
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
-----------------
Output 1:
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32
```

# Test suite

## Prerequisites
To be able to run the tests will be required to install the following gems:

```
gem install rspec
gem install rspec-expectations
```

## Running the tests

```
rspec -fdoc
```

