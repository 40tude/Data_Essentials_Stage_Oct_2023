-- The salaries_no_header.csv file is "clean" and available in ./data_warehouse

.mode csv
.separator ","

CREATE TABLE salaries (
    Id INTEGER PRIMARY KEY,
    EmployeeName TEXT,
    JobTitle TEXT,
    BasePay NUMERIC,
    OvertimePay NUMERIC,
    OtherPay NUMERIC,
    Benefits NUMERIC,
    TotalPay NUMERIC,
    PensionDebt NUMERIC,
    TotalPayBenefits NUMERIC,
    Year INTEGER,
    Agency TEXT);

.import "../data_warehouse/salaries_no_header.csv" salaries
.save "../data_warehouse/salaries.sqlite"
