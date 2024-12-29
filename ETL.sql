-- Databricks notebook source
-- MAGIC %python
-- MAGIC !pip install kagglehub

-- COMMAND ----------

-- MAGIC %python
-- MAGIC import kagglehub
-- MAGIC from pyspark.sql.functions import col, trim, when
-- MAGIC from pyspark.ml.feature import OneHotEncoder, StringIndexer, VectorAssembler
-- MAGIC from pyspark.ml import Pipeline
-- MAGIC from pyspark.ml.classification import LogisticRegression
-- MAGIC # Download latest version
-- MAGIC path = kagglehub.dataset_download("mustafakeser4/bigquery-fintech-dataset")
-- MAGIC
-- MAGIC print("Path to dataset files:", path)

-- COMMAND ----------

-- MAGIC %python
-- MAGIC !ls -ltra /root/.cache/kagglehub/datasets/mustafakeser4/bigquery-fintech-dataset/versions/1/

-- COMMAND ----------

-- MAGIC %python
-- MAGIC customer_df = spark.read.csv(
-- MAGIC     "file:///root/.cache/kagglehub/datasets/mustafakeser4/bigquery-fintech-dataset/versions/1/customer.csv",
-- MAGIC     header=True,       # Set to True if the CSV has a header
-- MAGIC     inferSchema=True,  # Prevent automatic type inference if fields are irregular
-- MAGIC     multiLine=True,     # Support multi-line fields
-- MAGIC     quote='"',          # Handle quoted fields properly
-- MAGIC     escape='"',         # Escape quotes inside quoted fields
-- MAGIC     sep=","             # Specify comma as the delimiter
-- MAGIC )
-- MAGIC loan_df = spark.read.csv(
-- MAGIC     "file:///root/.cache/kagglehub/datasets/mustafakeser4/bigquery-fintech-dataset/versions/1/loan.csv",
-- MAGIC     header=True,       # Set to True if the CSV has a header
-- MAGIC     inferSchema=True,  # Prevent automatic type inference if fields are irregular
-- MAGIC     multiLine=True,     # Support multi-line fields
-- MAGIC     quote='"',          # Handle quoted fields properly
-- MAGIC     escape='"',         # Escape quotes inside quoted fields
-- MAGIC     sep=","             # Specify comma as the delimiter
-- MAGIC )
-- MAGIC loan_with_region_df = spark.read.csv(
-- MAGIC     "file:///root/.cache/kagglehub/datasets/mustafakeser4/bigquery-fintech-dataset/versions/1/loan_with_region.csv",
-- MAGIC     header=True,       # Set to True if the CSV has a header
-- MAGIC     inferSchema=True,  # Prevent automatic type inference if fields are irregular
-- MAGIC     multiLine=True,     # Support multi-line fields
-- MAGIC     quote='"',          # Handle quoted fields properly
-- MAGIC     escape='"',         # Escape quotes inside quoted fields
-- MAGIC     sep=","             # Specify comma as the delimiter
-- MAGIC )

-- COMMAND ----------

-- MAGIC %python
-- MAGIC customer_df.createOrReplaceTempView("customer")
-- MAGIC loan_df.createOrReplaceTempView("loan")
-- MAGIC loan_with_region_df.createOrReplaceTempView("loan_with_region")
-- MAGIC

-- COMMAND ----------

select loan_amount, count(*) from loan group by loan_amount  order by loan_amount;

-- COMMAND ----------

select min(loan_amount) from loan;

-- COMMAND ----------

DESCRIBE customer;

-- COMMAND ----------

describe loan;

-- COMMAND ----------

DESCRIBE loan_with_region;

-- COMMAND ----------

-- Checking null percentage in customer table
SELECT 
    COUNT(*) AS total_rows,
    (COUNT(CASE WHEN emp_title IS NULL THEN 1 END) * 100.0) / COUNT(*) AS emp_title_null_percent,
    (COUNT(CASE WHEN emp_length IS NULL THEN 1 END) * 100.0) / COUNT(*) AS emp_length_null_percent,
    (COUNT(CASE WHEN annual_inc IS NULL THEN 1 END) * 100.0) / COUNT(*) AS annual_inc_null_percent,
    (COUNT(CASE WHEN annual_inc_joint IS NULL THEN 1 END) * 100.0) / COUNT(*) AS annual_inc_joint_null_percent,
    (COUNT(CASE WHEN customer_id IS NULL THEN 1 END) * 100.0) / COUNT(*) AS customer_id_null_percent,
    (COUNT(CASE WHEN home_ownership IS NULL THEN 1 END) * 100.0) / COUNT(*) AS home_ownership_null_percent,
    (COUNT(CASE WHEN verification_status IS NULL THEN 1 END) * 100.0) / COUNT(*) AS verification_status_null_percent,
    (COUNT(CASE WHEN zip_code IS NULL THEN 1 END) * 100.0) / COUNT(*) AS zip_code_null_percent,
    (COUNT(CASE WHEN addr_state IS NULL THEN 1 END) * 100.0) / COUNT(*) AS addr_state_null_percent,
    (COUNT(CASE WHEN avg_cur_bal IS NULL THEN 1 END) * 100.0) / COUNT(*) AS avg_cur_bal_null_percent,
    (COUNT(CASE WHEN Tot_cur_bal IS NULL THEN 1 END) * 100.0) / COUNT(*) AS Tot_cur_bal_null_percent
FROM customer;

-- COMMAND ----------
... (295 lines left)
