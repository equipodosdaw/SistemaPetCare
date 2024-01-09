<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if (session.getAttribute("admin") != null) {
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>PetCare | Inicio</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <%@ include file="../layout/links.jsp"%>  
    </head>

    <body class="hold-transition skin-blue sidebar-mini">

        <div class="wrapper">

            <%@ include file="../layout/header-admin.jsp"%>                  
            <%@ include file="../layout/aside-admin.jsp"%>

            <div class="content-wrapper">

                <section class="content-header">
                    <h1>
                        Inicio
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
                        <li class="active">Dashboard</li>
                    </ol>
                </section>
                
                 <section class="content">
                    <!-- Small boxes (Stat box) -->
                    <div class="row">
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-aqua">
                                <div class="inner">
                                    <h3>150</h3>

                                    <p>Mascotas</p>
                                </div>
                                <div class="icon">
                                    <i class="fa-solid fa-paw"></i>
                                </div>
                                <a href="#" class="small-box-footer">Más info <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-green">
                                <div class="inner">
                                    <h3>53<sup style="font-size: 20px">%</sup></h3>

                                    <p>Analíticas</p>
                                </div>
                                <div class="icon">
                                    <i class="fa-solid fa-chart-line"></i>
                                </div>
                                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-yellow">
                                <div class="inner">
                                    <h3>44</h3>

                                    <p>Veterinarios Activos</p>
                                </div>
                                <div class="icon">
                                    <i class="fa-solid fa-user-doctor"></i>
                                </div>
                                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <!-- ./col -->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-red">
                                <div class="inner">
                                    <h3>65</h3>

                                    <p>Consultas</p>
                                </div>
                                <div class="icon">
                                   <i class="fa-regular fa-calendar-days"></i>
                                </div>
                                <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <!-- ./col -->
                    </div>
                </section>
                <!-- /.content -->

            </div>
            
            

            <%@ include file="../layout/footer.jsp"%>

            <div class="control-sidebar-bg"></div>
        </div>

        <%@ include file="../layout/scripts.jsp"%>

    </body>
</html>
<%
    } else {
        response.sendRedirect("login.jsp");
    }
%>
