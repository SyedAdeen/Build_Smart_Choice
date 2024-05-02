
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import r2_score, mean_absolute_error, mean_squared_error
import numpy as np

def main2(min,max,area,floor):

    file=""
    if(area=='3'):
        file="Data_Sets_3.txt"
    elif(area=='5'):
        file="Data_Sets_5.txt"
    elif(area=='7'):
        file="Data_Sets_7.txt"
    elif(area=='1'):
        file="Data_Sets_1.txt"
    elif(area=='2'):
        file="Data_Sets_2.txt"
    else:
        print("Wrong area")
        file="Data_Sets_3.txt"

    
        
    # Load the dataset (assuming your data is in a txt file)
    data = pd.read_csv(file, header=None)

    # Split the features (X) and target variables (y)
    X = data.iloc[:, :4]  # First 4 columns as features
    y = data.iloc[:, 5:]  # Remaining columns as target variables

    # Split data into training and test sets (80% for training, 20% for testing)
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    # Train the model
    model = LinearRegression()
    model.fit(X_train, y_train)  # Train on the training set

    # Get user input for new data point
    new_data = [min,max,area,floor]
    # for i in range(5):  # Assuming 5 features
    #     value = float(input(f"Enter value for feature {i+1}: "))
    #     new_data.append(value)

    # Convert user input to a pandas dataframe (single row)
    new_data_df = pd.DataFrame([new_data])

    # Make prediction on the new data
    prediction = model.predict(new_data_df)[0]  # Get the first element from the prediction array
    print("Predicted value:", np.around(prediction, decimals=0))

    # Make predictions on the test set
    # y_pred = model.predict(X_test)
    return np.around(prediction, decimals=0)

    # Calculate accuracy metrics    
    # mae = mean_absolute_error(y_test, y_pred)
    # rmse = np.sqrt(mean_squared_error(y_test, y_pred))
    # r2 = r2_score(y_test, y_pred)

    # # Print the results
    # print("Mean Absolute Error:", mae)
    # print("Root Mean Squared Error:", rmse)
    # print("R-squared score:", r2)

if __name__=="__main__":
    main2()
