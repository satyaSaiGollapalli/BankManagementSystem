<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: linear-gradient(to bottom right, #e0f7fa, #81d4fa);
        }

        .container {
            display: flex;
            flex-direction: row;
            width: 85%;
            height: 85vh;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .form-section {
            width: 50%;
            padding: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            background-color: #f4f7f6;
        }

        .form-section form {
            width: 100%;
        }

        h2 {
            color: #00796b;
            font-size: 2em;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="number"],
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1em;
        }

        input[type="submit"] {
            background-color: #00796b;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #004d40;
        }

        input::placeholder {
            color: #999;
        }

        input:focus {
            border-color: #00796b;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 121, 107, 0.5);
        }

        .content-section {
            width: 50%;
            background-color: #00796b;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            flex-direction: column;
            padding: 30px;
        }

        .content-section h3 {
            font-size: 2em;
            margin-bottom: 20px;
            text-align: center;
        }

        .content-section p {
            font-size: 1.2em;
            text-align: center;
            line-height: 1.5em;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Form Section -->
    <div class="form-section">
        <form action="registration" method="post">
            <h2>Registration Page</h2>

            <input type="text" placeholder="Enter your name" name="name" required>

            <input type="email" placeholder="Enter your email" name="email" required>

            <input type="tel" placeholder="Enter your mobile number" name="mobile" minlength="10" maxlength="10" pattern="[0-9]{10}" required>

            <input type="text" placeholder="Enter your Aadhar Number" name="aadhar" minlength="12" maxlength="12" pattern="[0-9]{12}" required>

            <input type="text" placeholder="Enter your address" name="add" required>

            <input type="text" placeholder="Enter Your PAN" name="pan" minlength="10" maxlength="10" pattern="[A-Z]{5}[0-9]{4}[A-Z]{1}" required>

            <input type="number" placeholder="Enter amount" name="amount" step="0.01" required>

            <input type="text" placeholder="Enter your gender" name="gender" required>

            <input type="submit" value="Register">
        </form>
    </div>

    <!-- Content Section -->
    <div class="content-section">
        <h3>Welcome to Our Registration Page</h3>
        <p>Fill in the form to register and join our amazing community. We ensure that your personal information is safe and secure.</p>
    </div>
</div>

</body>
</html>
