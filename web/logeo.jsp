<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title></title>
        <link rel="stylesheet" href="css/estilos.css">

        <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/menu-12.css">

    </head>
    <style type="text/css">
        <!--body{
            background-color: #FDDEF1;
        }-->
    </style>
    <body>
        <header >
            <div id="loc">
                <img src="recursos/img/logo1.png">
            </div>
        </header>
        <div class="container">
            <div class="row">

                <div class="col-ws-12 col-sm-3 col-md-3"></div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <form action="vr.php" method="POST" class="form-horizontal">
                        <div class="form-group">
                            <div class="col-sm-3"></div>
                            <div class="input-group col-sm-6">
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-user"></span>
                                </span>
                                <input type="text" name="usuario" class="form-control" placeholder="Usuario">
                            </div>
                        </div>
                        <div class="form-group"> 
                            <div class="col-sm-3"></div>
                            <div class="input-group col-sm-6">
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-lock"></span>
                            </span>
                            <input type="password" name="password" class="form-control" required placeholder="Password">
                        </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-5">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox">Recordar contraseña
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-5 col-sm-3">
                                <input type="submit"  class="btn btn-success" value="Entrar">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-ws-12 col-sm-3 col-md-3"></div>
            </div>
        </div>
        <script src="jquery/jquery-1.11.2.min.js"></script>
        <script src="bootstrap/js/bootstrap.js"></script>
    </body>
</html>