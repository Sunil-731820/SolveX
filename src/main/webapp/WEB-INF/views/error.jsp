<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Error | Code Bloom</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="alert alert-danger shadow p-4 text-center" style="max-width:500px;">
        <h4 class="mb-3">❌ Error</h4>

        <p>${errorMessage}</p>

        <a href="${redirectPage}" class="btn btn-primary mt-3">Go Back</a>
    </div>
</div>

</body>
</html>
