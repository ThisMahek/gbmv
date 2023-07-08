<!DOCTYPE html>
<html <?php echo $this->customlib->getRTL(); ?>>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><?php echo $this->customlib->getAppName(); ?></title>         
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <meta name="theme-color" content="#424242" />
        <link href="<?php echo base_url(); ?>/uploads/school_content/logo/<?php echo $this->setting_model->getSchoolLogo();?>" rel="shortcut icon" type="image/x-icon">
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/dist/css/style-main.css">

        <?php
        $this->load->view('layout/theme');
        ?>
        <?php
        if ($this->customlib->getRTL() != "") {
            ?>
            <!-- Bootstrap 3.3.5 RTL -->
            <link rel="stylesheet" href="<?php echo base_url(); ?>backend/rtl/bootstrap-rtl/css/bootstrap-rtl.min.css"/>  
            <!-- Theme RTL style -->
            <link rel="stylesheet" href="<?php echo base_url(); ?>backend/rtl/dist/css/AdminLTE-rtl.min.css" />
            <link rel="stylesheet" href="<?php echo base_url(); ?>backend/rtl/dist/css/ss-rtlmain.css">
            <link rel="stylesheet" href="<?php echo base_url(); ?>backend/rtl/dist/css/skins/_all-skins-rtl.min.css" />

            <?php
        } else {
            
        }
        ?>
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/dist/css/font-awesome.min.css">      
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/dist/css/ionicons.min.css">       

        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/iCheck/flat/blue.css">      
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/morris/morris.css">       
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/jvectormap/jquery-jvectormap-1.2.2.css">        
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/datepicker/datepicker3.css">       
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/daterangepicker/daterangepicker-bs3.css">      
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/sweet-alert/sweetalert2.css">
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/dist/css/custom_style.css">
        <link rel="stylesheet" href="<?php echo base_url(); ?>backend/datepicker/css/bootstrap-datetimepicker.css">

         <!--print table-->
        <link href="<?php echo base_url(); ?>backend/dist/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="<?php echo base_url(); ?>backend/dist/datatables/css/buttons.dataTables.min.css" rel="stylesheet">
        <link href="<?php echo base_url(); ?>backend/dist/datatables/css/dataTables.bootstrap.min.css" rel="stylesheet">
        <script src="<?php echo base_url(); ?>backend/custom/jquery.min.js"></script>
        <script src="<?php echo base_url(); ?>backend/dist/js/moment.min.js"></script>
        <script src="<?php echo base_url(); ?>backend/datepicker/js/bootstrap-datetimepicker.js"></script>
        <script src="<?php echo base_url(); ?>backend/datepicker/date.js"></script>       
        <script src="<?php echo base_url(); ?>backend/dist/js/jquery-ui.min.js"></script>
        <script src="<?php echo base_url(); ?>backend/js/school-custom.js"></script>
        <script type="text/javascript">
            var baseurl = "<?php echo base_url(); ?>";
        </script>
        <style>
                .parimary{
                background:white!important;
                }
                .secondary_color{
                    background:#0060ff!important;
                }
                 .table thead tr{
                              background: #ececec;
                      }
                      thead th{
                        border-bottom:0px!important;
                      }
                      .det-name{
                          padding-right:0px;
                      }
                      .det-name {
                        padding-right: 0px;
                        font-size: 13px;
                        line-height: 20px;
                    }
                    .skin-blue .main-header .navbar{
                    background:#0060ff!important;
                }
                .skin-blue .main-header .logo:hover{
                    background:#0060ff!important;
                }
                .skin-blue .main-header .logo{
                    background:#0060ff!important;
                }
                .modal-header{
                    background:#0060ff!important;
                }
                .cfees{
                    background:#0060ff!important;
                    border: 1px solid #0060ff;
                }
                .box.box-info {
                  border-top-color:#0060ff;
                }            
            /*change theme color in all section */
                
                .skin-blue .sidebar-menu > li:hover > a, .skin-blue .sidebar-menu > li.active > a {
                    background:#0060ff!important;
               }
               .skin-blue .treeview-menu > li > a:hover {
                color: #0060ff;
            }
            .nav-tabs-custom>.nav-tabs>li.active {
                border-top-color: #0060ff;
            }
            .btn-primary {
                background-color: #0060ff;
                border-color: #0060ff;
                transition: .3s;
            }
            .btn-primary:hover{
               background-color:#6192e5;
                border-color: #0060ff;
                transition: .3s; 
            }
            .chosebtn {
                background: #0060ff !important;
                border: 1px solid #0060ff;
                color: #fff;
            }
            .chosebtn:hover{
                 background: #6192e5 !important;
                border: 1px solid #0060ff;
                color: #fff;
            }
            .btn-info {
                background-color: #0060ff;
                border-color: #0060ff;
            }
            .btn-info:hover{
               background-color: #6192e5;
                border-color: #0060ff;  
            }
            .box.box-success {
                border-top-color: #0060ff;
                
            }
            
                .skin-blue .main-header .navbar .dropdown-user li a{
                    color:black!important;
                }
                .flex_class{
                    display:flex;
                }
                .box.box-primary{
                 border-top-color: #ffffff !important;
                }
               
                @media (min-width: 768px){
            .form-inline .form-group {
                margin-bottom: 4%;
            }
            }
            
            @media screen and (min-width:320px) and (max-width:767px){
                .mobile-r{
                margin-left: 2%;
                padding-left: 0;
                padding-right: 14px;
                width: 71%;
                }
                .tab_side{
                        height: 315px!important;
                }
                .flex_class {
                display: block;
            }
            .margin_right{
                margin-right:0%;
                margin-top:1%;
            }
            label{
                  margin-top: 1%;  
            }
            }
             table.table-bordered.dataTable th:last-child, table.table-bordered.dataTable th:last-child, table.table-bordered.dataTable td:last-child, table.table-bordered.dataTable td:last-child {
                border-right-width: 0;
                text-align: left!important;
                float: left!important;
            }   
            .table.dataTable thead>tr>th.sorting:last-child {
                padding-right: 50px !important;
                text-align: left;
            }
            @media only screen and (max-width: 600px) {
                 .det-name {
                font-size: 11px;
                }
            }
               
        </style>
    </head>
    <body class="hold-transition skin-blue fixed sidebar-mini">
        <div class="wrapper">
            <header class="main-header" id="alert">               
                <a href="<?php echo base_url(); ?>accountant/accountant/dashboard" class="logo">                  
                    <span class="logo-mini">S S</span>                   
                    <span class="logo-lg"><img src="<?php echo base_url(); ?>/uploads/school_content/logo/<?php echo $this->setting_model->getSchoolLogo();?>" style="width:auto;height:50px;border-radius:50%" alt="<?php echo $this->customlib->getAppName() ?>" /></span>
                </a>               
                <nav class="navbar navbar-static-top" role="navigation">                  
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </a>
                    <div class="col-md-5 col-sm-3 col-xs-4">  
                        <span href="#" class="sidebar-session">
                            <?php echo $this->setting_model->getCurrentSchoolName(); ?>
                        </span>
                    </div>        
                    <div class="col-md-7 col-sm-9 col-xs-8">
                        <div class="pull-right">           

                            <div class="navbar-custom-menu">
                                <ul class="nav navbar-nav"> 

                                    <li class="dropdown">
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false"><?php echo $this->customlib->getStudentSessionUserName(); ?>
                                            <i class="fa fa-user-secret fa-fw"></i>  <i class="fa fa-caret-down"></i>
                                        </a>
                                        <ul class="dropdown-menu dropdown-user">
                                            <li><a href="<?php echo base_url(); ?>accountant/accountant/changepass"><i class="fa fa-key"></i> <?php echo $this->lang->line('change_password'); ?></a>
                                            </li>
                                            <li class="divider"></li>
                                            <li><a href="<?php echo base_url(); ?>site/userlogout"><i class="fa fa-sign-out fa-fw"></i> <?php echo $this->lang->line('logout'); ?></a>
                                            </li>
                                        </ul>                             
                                    </li> 
                                </ul>
                            </div>
                        </div>
                    </div>
                </nav>
            </header>
            <aside class="main-sidebar" id="alert2">                
                <section class="sidebar" id="sibe-box">
                    <form class="navbar-form navbar-left search-form2" role="search"  action="<?php echo site_url('accountant/accountant/search'); ?>" method="POST">
                        <?php echo $this->customlib->getCSRF(); ?>
                        <div class="input-group ">
                            <input type="text" name="search_text" class="form-control search-form" placeholder="<?php echo $this->lang->line('search_by_name,_roll_no,_enroll_no,_national_identification_no,_local_identification_no_etc..'); ?>">
                            <span class="input-group-btn">
                                <button type="submit" name="search" id="search-btn" style="padding: 3px 12px !important;border-radius: 0px 30px 30px 0px; background: #fff;" class="btn btn-flat"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </form>    
                    <ul class="sessionul fixedmenu">
                        <li class="removehover accurrent">
                            <?php echo $this->lang->line('current_session') . ": " . $this->setting_model->getCurrentSessionName(); ?>
                        </li>
                    </ul>                    
                    <ul class="sidebar-menu verttop38">
                         <li class="treeview <?php echo set_Topmenu('Student Information'); ?>">
                <a href="#">
                    <i class="fa fa-user-plus"></i> <span><?php echo $this->lang->line('student_information'); ?></span> <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                                        <li class="<?php echo set_Submenu('student/create'); ?>"><a href="<?php echo base_url(); ?>accountant/student/create/accountant"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('student_admission'); ?></a></li>
                    <li class="<?php echo set_Submenu('student/search'); ?>"><a href="<?php echo base_url(); ?>accountant/student/search/accountant"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('student_details'); ?></a></li>

                    <li class="<?php echo set_Submenu('category/index'); ?>"><a href="<?php echo base_url(); ?>accountant/category/index"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('student_categories'); ?></a></li>
                    <li class="<?php echo set_Submenu('stdtransfer/index'); ?>"><a href="<?php echo base_url(); ?>accountant/stdtransfer/index/accountant"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('promote_students'); ?></a></li>
                </ul>
            </li>
                        <li class="treeview <?php echo set_Topmenu('Fees Collection'); ?>">
                            <a href="#">
                                <i class="fa fa-money"></i> <span> <?php echo $this->lang->line('fees_collection'); ?></span> <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                                                <li class="<?php echo set_Submenu('accountant/feegroup'); ?>"><a href="<?php echo base_url(); ?>accountant/feegroup"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('fees_group'); ?></a></li>
                                <li class="<?php echo set_Submenu('feetype/index'); ?>"><a href="<?php echo base_url(); ?>accountant/feetype"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('fees_type'); ?></a></li>
                                                                <li class="<?php echo set_Submenu('feemaster/index'); ?>"><a href="<?php echo base_url(); ?>accountant/feemaster"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('fees_master'); ?></a></li>
                                <li class="<?php echo set_Submenu('studentfee/index'); ?>"><a href="<?php echo base_url(); ?>accountant/studentfee"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('collect_fees'); ?></a></li>


                                <!--<li class="<?php echo set_Submenu('accountant/feediscount'); ?>"><a href="<?php echo base_url(); ?>accountant/feediscount"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('fees_discount'); ?></a></li>-->
                                <li class="<?php echo set_Submenu('studentfee/searchpayment'); ?>"><a href="<?php echo base_url(); ?>accountant/studentfee/searchpayment"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('search_fees_payment'); ?></a></li>
                                <li class="<?php echo set_Submenu('studentfee/feesearch'); ?>"><a href="<?php echo base_url(); ?>accountant/studentfee/feesearch"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('search_due_fees'); ?> </a></li>
                                <li class="<?php echo set_Submenu('studentfee/reportbyname'); ?>"><a href="<?php echo base_url(); ?>accountant/studentfee/reportbyname"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('fees_statement'); ?></a></li>
                                <li class="<?php echo set_Submenu('transaction/studentacademicreport'); ?>"><a href="<?php echo base_url(); ?>accountant/transaction/studentacademicreport"><i class="fa fa-angle-double-right"></i>
                                        <?php echo $this->lang->line('balance_fees_report'); ?></a></li>
                            </ul>
                        </li>

                        <!--<li class="treeview <?php echo set_Topmenu('Income'); ?>">-->
                        <!--    <a href="#">-->
                        <!--        <i class="fa fa-credit-card"></i> <span><?php echo $this->lang->line('income'); ?></span> <i class="fa fa-angle-left pull-right"></i>-->
                        <!--    </a>-->
                        <!--    <ul class="treeview-menu">-->
                        <!--        <li class="<?php echo set_Submenu('income/index'); ?>"><a href="<?php echo base_url(); ?>accountant/income"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('add_income'); ?></a></li>-->
                        <!--        <li class="<?php echo set_Submenu('income/incomesearch'); ?>"><a href="<?php echo base_url(); ?>accountant/income/incomesearch"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('search_income'); ?></a></li>-->
                        <!--        <li class="<?php echo set_Submenu('incomehead/index'); ?>"><a href="<?php echo base_url(); ?>accountant/incomehead"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('income_head'); ?></a></li>-->
                        <!--    </ul>-->
                        <!--</li>-->

                        <li class="treeview <?php echo set_Topmenu('Expenses'); ?>">
                            <a href="#">
                                <i class="fa fa-credit-card"></i> <span><?php echo $this->lang->line('expenses'); ?></span> <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">
                                <li class="<?php echo set_Submenu('expense/index'); ?>"><a href="<?php echo base_url(); ?>accountant/expense"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('add_expense'); ?></a></li>
                                <li class="<?php echo set_Submenu('expense/expensesearch'); ?>"><a href="<?php echo base_url(); ?>accountant/expense/expensesearch"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('search_expense'); ?></a></li>
                                <li class="<?php echo set_Submenu('expenseshead/index'); ?>"><a href="<?php echo base_url(); ?>accountant/expensehead"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('expense_head'); ?></a></li>
                            </ul>
                        </li>
                        <li class="treeview <?php echo set_Topmenu('Reports'); ?>">
                            <a href="#">
                                <i class="fa fa-line-chart"></i> <span><?php echo $this->lang->line('reports'); ?></span> <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">

                                <li class="<?php echo set_Submenu('reportbyname/index'); ?>"><a href="<?php echo base_url(); ?>accountant/studentfee/reportbyname"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('fees_statement'); ?></a></li>
                                <li class="<?php echo set_Submenu('transaction/studentacademicreport'); ?>"><a href="<?php echo base_url(); ?>accountant/transaction/studentacademicreport"><i class="fa fa-angle-double-right"></i>
                                        <?php echo $this->lang->line('balance_fees_report'); ?></a></li>                               
                                <li class="<?php echo set_Submenu('transaction/searchtransaction'); ?>"> <a href="<?php echo base_url(); ?>accountant/transaction/searchtransaction"><i class="fa fa-angle-double-right"></i> <?php echo $this->lang->line('transaction_report'); ?></a></li>

                            </ul>
                        </li>

                    </ul>
                </section>               
            </aside>