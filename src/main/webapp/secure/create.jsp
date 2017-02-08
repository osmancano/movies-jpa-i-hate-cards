<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Movies Store</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        /* Remove the navbar's default margin-bottom and rounded borders */
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
            background-color: #095b77;
        }

        /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
        .row.content {height: 450px}

        /* Set gray background color and 100% height */
        .sidenav {
            padding-top: 20px;
            background-color: #f1f1f1;
            height: 100%;
        }

        /* Set black background color, white text and some padding */
        footer {
            background-color: #095b77;
            color: white;
            padding: 15px;
        }

        /* On small screens, set height to 'auto' for sidenav and grid */
        @media screen and (max-width: 767px) {
            .sidenav {
                height: auto;
                padding: 15px;
            }
            .row.content {height:auto;}
        }
    </style>
</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Logo</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li><a href="/secure/movies">Home</a></li>
                <li class="active"><a href="">Create</a></li>
                <li><a href="/secure/favourites">Favourites</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/secure/logout"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="row">
        <h4>Create Movie Form:</h4>
        <div class="col-sm-6 offset-sm-2">
            <form class="form" action="/secure/create" method="post">
                <div class="form-group">
                    <label for="mName">Movie Name:</label>
                    <input type="text" class="form-control" id="mName" name="mName" required/>
                </div>
                <div class="form-group">
                    <label for="mDesc">Description:</label>
                    <input type="text" class="form-control" id="mDesc" name="mDesc" required/>
                </div>
                <div class="form-group">
                    <label for="mPostUrl">Post URL:</label>
                    <input type="url" class="form-control" id="mPostUrl" name="mPostUrl" required/>
                </div>
                <div class="form-group">
                    <label for="mMpaa">MPAA Rating:</label>
                    <select id="mMpaa" name="mMpaa">
                        <option value="G">G</option>
                        <option value="PG">PG</option>
                        <option value="PG-13">PG-13</option>
                        <option value="NC-17">NC-17</option>
                        <option value="UR">UR</option>
                        <option value="R">R</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="mCategory">Category:</label>
                    <select id="mCategory" name="mCategory">
                        <option value="Family">Family</option>
                        <option value="Adventure">Adventure</option>
                        <option value="Comedy">Comedy</option>
                        <option value="Fantasy">Fantasy</option>
                        <option value="Romance">Romance</option>
                        <option value="Thriller">Thriller</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="mRating">Rating:</label>
                    <input type="number" class="form-control" id="mRating" name="mRating" step="0.01" required/>
                </div>
                <button type="submit" class="btn btn-info">Add Movie</button>
            </form>
            <br/>
        </div>
    </div>
</div>




<footer class="container-fluid text-center">
    <p>Welcome To Skippers Web App</p>
</footer>

</body>
</html>
