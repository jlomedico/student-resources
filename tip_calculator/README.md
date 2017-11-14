# Tip Calculator Ruby Hackathon

Build a command-line tip calculator. It should use `gets` to prompt the user for:

* the total restaurant bill (without the tip)
* the percent amount you'd like to tip
* the number of people at your table

After you collect all the data, the program should output:

* the total bill including the total tip
* my share of the total bill (the amount that I owe in my group)

## Optional features

* Create a pretty text-only interface.
  * e.g. Make the final output look like a sales receipt.
  * e.g. Horizontally align money values along their decimal points.
```
  $1.00
 $25.50
$100.10
```
* Use methods (if we've learned about them by now).
* Is a 20% tip entered as `20` or `0.2`?
  * To avoid this issue, you may allow the user to select from a pre-determined menu of tip percents (e.g. 10%, 15%, and 20%).
* Correctly format money values to 2 decimal places.
* Correctly splitting the bill (is not as easy as it sounds).
