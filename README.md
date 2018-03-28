# R Chi-Square Post Hoc over the Fisher Exact Test

This function separates the lager than 2x2 tables to 2x2 tables for each of combination of rows and columns. Then, implements Fisher's exact test for each 2x2 table. This provides to determine the dependency of variables by considering binary elements. It can be implement for explore specific binary relations after implement chi-square test. 

# Usage:
```
# table: is a frequnecy table
fisher_posthoc(table)
# Returns all significant (p < 0.05) relation as data frame
```

