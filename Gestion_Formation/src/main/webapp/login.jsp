<!DOCTYPE html>
<html lang="en">
   <head>
      <title>Login</title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&amp;display=swap" rel="stylesheet">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" href="css/login-style.css">
      <style type="text/css"></style>
   </head>
   <body class="img js-fullheight" style="background-image: url(&quot;./assets/img/bg-masthead.jpg&quot;); height: 828px;">
      <section class="ftco-section">
         <div class="container bag">
         	<div>
            <div class="row justify-content-center">
               <div class="col-md-6 text-center mb-5 mt-3">
                  <h2 class="heading-section">Se connecter</h2>
               </div>
            </div>
            <div class="row justify-content-center">
               <div class="" style="width: 60%"><!-- col-md-6 col-lg-4 -->
                  <div class="login-wrap p-0">
                     <form action="login" method="post" class="signin-form">
                        <div class="form-group">
                           <input type="text" name="username" class="form-control" placeholder="Pseudo" required="">
                        </div>
                        <div class="form-group">
                           <input id="password-field" name="userpass" type="password" class="form-control" placeholder="Mot de passe" required="">
                           <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                        </div>
                        <div class="form-group">
                           <button type="submit" class="form-control btn btn-primary submit px-3">Valider</button>
                        </div>
                        <div class="form-group d-md-flex">
                           <div class="w-50">
                              <label class="checkbox-wrap checkbox-primary">Rester connecté
                              <input type="checkbox" checked="">
                              <span class="checkmark"></span>
                              </label>
                           </div>
                           <div class="w-50 text-md-right">
                              <a href="index.html" style="color: #fff">Retourner</a>
                           </div>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div>
     </div>
      </section>
   </body>
</html>