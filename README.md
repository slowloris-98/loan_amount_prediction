# Loan Disbursement Prediction

Loans are a vital factor in economic development as they allow businesses and individuals to grow and boost the economy. They enable business expansion, innovation initiatives, real estate development, job creation, and liquidity in financial markets.

This project aims to predict the right amount of loan for an applicant based on various factors such as demographics, purpose, market demands, income, and other features. For this purpose, we are utilizing the **BigQuery Fintech Dataset** from Kaggle, which includes tables containing customer information, previous years' loan disbursement details, regional data, and other relevant information.


## Data Description
### Dataset Description

We used the **BigQuery Fintech Dataset** from Kaggle, which contains the following six tables:

- **customer**: Primary table for customer data. This table includes all customer details.
- **loan**: Details of previous loan disbursements, such as loan amount, purpose, and interest rates.
- **loan_count_by_year**: Trends showing the number of loans disbursed over previous years.
- **loan_purposes**: Lists all the purposes for which previous loans have been approved.
- **loan_with_regions**: Links loan data to regional and geographical aspects.
- **state_regions**: Geographical mapping of states and regions for more precise analysis.


### Data Pre-processing

1. **Handle Missing Data**:  
   Columns with more than 50% missing values were dropped to ensure data quality and reduce noise.

3. **Dropping Irrelevant Features**:  
   Non-essential columns that do not contribute to the analysis or prediction goals were eliminated.

5. **Removing Duplicate Records**:  
   Duplicate entries across the dataset were removed to avoid redundancy and bias.

7. **Addressing Null Values in String Columns**:  
   Records with null values in essential string-based columns were excluded from the dataset.

9. **Data Normalization**:  
   Numerical features were normalized, and string-based features were mapped with uniform values where multiple strings represented the same outcome.

11. **Categorical Variable Transformation**:  
   Categorical variables were transformed into binary format using One-Hot Encoding to enable their use in machine learning models.

---

### Data Visualization

1. **Loan Amount and Loan Type**:  
   This visualization showcases the trend between loan amount and loan type (individual, joint, and direct pay). It highlights which mortgage type is most and least approved.
     
   <img src="https://github.com/user-attachments/assets/7668ce46-1a24-4cbe-bfe3-b8236a37ab93" alt="Total Loan Amount Distribution Based on Regions" width="350">

3. **Total Loan Amount Distribution Based on Regions**:  
   This visualization identifies which regions have the largest and smallest shares of the total loan amount.
   
     <img src="https://github.com/user-attachments/assets/580bd1de-09fd-45fd-816b-b3504d406c2e" alt="Loan Amount and Loan Type" width="350">


## Proposed Method

We implemented the following steps to predict the loan amount:

1. Extract the data from Kaggle.
2. Transform the data by performing data preprocessing.
3. Split the data into train and test sets (70-30 split).
4. Load the train data into the models.
5. Train all the models.
6. Evaluate the models using the test data.
7. Compare the results from different models.

<img src="https://github.com/user-attachments/assets/cbb1cb3b-3406-424e-a9be-95f8928d1ceb" alt="Proposed Solution" width="350">

## Models Used

### Linear Regression
Linear Regression is used as the first model to provide a baseline on performance and capture the linear relationship between the loan amount and other variables. It is also easy to interpret as it provides a mathematical equation that quantifies the impact of each independent variable, making it easy to understand how factors like income influence the loan amount.

### Decision Tree
A decision tree is used, aiming to capture non-linear relationships between the data that linear regression does not capture. It is also effective for identifying variable thresholds that influence the loan amount. Different depths of trees, ranging from 5 to 20, have been experimented with to fine-tune performance.

### Random Forest
Random Forest builds upon decision trees by combining predictions from multiple trees, improving robustness, and reducing over-fitting. This model also handles noisy data better than a single decision tree.

### Recurrent Neural Network (RNN)
RNNs are particularly useful when the data involves sequential or time-dependent patterns. While loan data does not appear to follow either pattern, this model is employed to confirm the assumption. Three Long Short-Term Memory (LSTM) layers were used with 50, 25, and 12 units, followed by a single-unit output.

## Conclusion

This project utilized the **BigQuery Fintech Dataset** to implement and evaluate various machine learning models, including Linear Regression, Decision Tree, Random Forest, Multiple Layer Perceptron (MLP), and Recurrent Neural Network (RNN).

**Linear Regression** performed competitively, suggesting a strong linear correlation in the dataset. **Decision Tree** and **Random Forest** achieved comparable results, with Random Forest offering smoother predictions. The evaluation of RNN confirmed the absence of sequential or temporal patterns in the dataset, rendering it less suitable for this task.

By leveraging advanced machine learning techniques, this project highlights the potential for streamlining loan approval processes through accurate loan amount predictions. The results pave the way for further refinements, such as integrating additional datasets, exploring advanced neural architectures, or employing ensemble models to enhance predictive accuracy. These advancements can empower lenders to make informed, data-driven decisions, fostering economic growth while mitigating financial risks.

<img src="https://github.com/user-attachments/assets/a1d7757d-82d2-4532-9f66-10e036a4bb68" alt="Evalution Table" width="350">





