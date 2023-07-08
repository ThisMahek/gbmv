<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>
<style>
@media print {
  body * {
    visibility: hidden;
  }
  #print_page, #print_page * {
    visibility: visible;
  }
  #print_page {
    /*position: absolute;*/
    left: 0;
    top: 0;
    /*bottom:10;*/
  }
  .filter-card{
      display:none;
  }
}
@media screen and (max-width: 600px) {
  .mobile-font{
    font-size: 12px;
  }
  #print_page  td{
      font-size:12px;
      padding: 3px 0px;
  }
  #print_page  th{
      font-size:12px;
      padding: 3px 0px;
  }
}
</style>
<div class="content-wrapper" style="min-height:auto">
    <section class="content-header">
        <h1>
            <i class="fa fa-money"></i> <?php echo $this->lang->line('fees_collection'); ?> <small><?php echo $this->lang->line('student1'); ?></small>  </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <!-- left column -->
            <div class="col-md-12">
                <div class="box box-primary filter-card">
                    <div class="box-header with-border">
                        <div class="row">
                            <div class="col-md-4">
                                <h3 class="box-title"><i class="fa fa-search"></i> <?php echo $this->lang->line('select_criteria'); ?></h3>
                            </div>  
                            <div class="col-md-8 ">
                                <div class="btn-group pull-right">
                                    <a href="<?php echo base_url() ?>studentfee" type="button" class="btn btn-primary btn-xs">
                                        <i class="fa fa-arrow-left"></i> <?php echo $this->lang->line('back'); ?></a>
                                </div>
                            </div>   
                        </div>
                    </div> 
                    <form action="<?php echo site_url('accountant/studentfee/reportbyname') ?>"  method="post" accept-charset="utf-8">
                        <div class="box-body">
                            <?php echo $this->customlib->getCSRF(); ?>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('class'); ?></label>
                                        <select autofocus="" id="class_id" name="class_id" class="form-control" >
                                            <option value=""><?php echo $this->lang->line('select'); ?></option>
                                            <?php
                                            foreach ($classlist as $class) {
                                                ?>
                                                <option value="<?php echo $class['id'] ?>" <?php if (set_value('class_id') == $class['id']) echo "selected=selected" ?>><?php echo $class['class'] ?></option>
                                                <?php
                                                $count++;
                                            }
                                            ?>
                                        </select>
                                        <span class="text-danger"><?php echo form_error('class_id'); ?></span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('section'); ?></label>
                                        <select  id="section_id" name="section_id" class="form-control" >
                                            <option value=""><?php echo $this->lang->line('select'); ?></option>
                                        </select>
                                        <span class="text-danger"><?php echo form_error('section_id'); ?></span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1"><?php echo $this->lang->line('student'); ?></label>
                                        <select  id="student_id" name="student_id" class="form-control" >
                                            <option value=""><?php echo $this->lang->line('select'); ?></option>
                                        </select>
                                        <span class="text-danger"><?php echo form_error('student_id'); ?></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer">

                            <button type="submit" class="btn btn-primary pull-right btn-sm"><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>
                        </div>
                    </form>
                </div>
                 <i class="fa fa-print" aria-hidden="true" style="font-size:30px;padding-top:10px;padding-left:10px;" onclick="window.print()"></i>
                <?php
                if (isset($student_due_fee)) {
                    
                    //code
                        $total_amount = "0";
                                        $total_deposite_amount = "0";
                                        $total_fine_amount = "0";
                                        $total_discount_amount = "0";
                                        $total_balance_amount = "0";
                                        $alot_fee_discount = 0;
                                        foreach ($student_due_fee as $key => $fee) {

                                            foreach ($fee->fees as $fee_key => $fee_value) {
                                                $fee_paid = 0;
                                                $fee_discount = 0;
                                                $fee_fine = 0;
                                                $fee_deposits_value_1=0;
                                                $total_amt=0;
                                                $totaldue_fee=0;
                                                $total_amt2=0;
                                                $totaldespoit_amount=0;
                                                $totaldue_fee2=0;
$fee_paid2=0;

  if (!empty($fee_value->amount_detail)) {
                                                    $fee_deposits = json_decode(($fee_value->amount_detail));

                                                    foreach ($fee_deposits as $fee_deposits_key => $fee_deposits_value) {
                                                        $fee_paid = $fee_paid + $fee_deposits_value->amount;
                                                        $fee_discount = $fee_discount + $fee_deposits_value->amount_discount;
                                                        $fee_fine = $fee_fine + $fee_deposits_value->amount_fine;
                                                    }
                                                }
                                                $total_amount = $total_amount + $fee_value->amount;
                                                $total_discount_amount = $total_discount_amount + $fee_discount;
                                                $total_deposite_amount = $total_deposite_amount + $fee_paid;
                                                $total_fine_amount = $total_fine_amount + $fee_fine;
                                                $feetype_balance = $fee_value->amount - ($fee_paid + $fee_discount);
                                                $total_balance_amount = $total_balance_amount + $feetype_balance;
                                               $totaldespoit_amount=($total_amount-$total_discount_amount);
                                               $totaldue_fee=($totaldespoit_amount-$total_deposite_amount);
                                           if($totaldue_fee<0)
                                           {
                                               $totaldue_fee2=0.00;
                                           }
                                       else
                                       {
                                            $totaldue_fee2=$totaldue_fee;
                                       }
                                            }
                                        }
                                                ?>
                    

                    <div class="box box-primary" id="print_page" >
                       <div class="box-header">
                          <h3 class="box-title" style="text-algin:center;">
                             <i class="fa fa-file-text-o"></i> <?php echo $this->lang->line('fees_statement'); ?>
                          </h3>
                       </div>
                       <div class="box-body" style="padding-top:0;">
                          <div class="row">
                             <div class="col-md-12">
                                <div class="sfborder">
                                   <div class="col-md-10">
                                      <div class="row">
                                         <!--<table >-->
                                         <tbody>
                                            <!---new design--->
                                            <div class="table-responsive">
                                               <table class="example-invoice" style=" border-collapse: collapse;width:100% !important;text-align:left;">
                                                  <tr>
                                                     <td colspan="3" style="padding-top:10px;padding-bottom:10px;width:10%"> 
                                                        <img src="<?php echo base_url(); ?>/uploads/school_content/logo/<?php echo $this->setting_model->getSchoolLogo();?>" style="height:100px">
                                                     </td>
                                                     <td colspan="6" style="padding-top:10px; text-align: left;padding-bottom:10px;">
                                                        <h3 class="mobile-font" style="padding-bottom: 10px;margin-bottom:10px; text-align: center;"><?php echo $this->customlib->getAppName(); ?>
                                                           <br> Paliyo, Bangarmaa Unnao
                                                        </h3>
                                                     </td>
                                                     <td colspan="3" style="padding-top:10px;padding-bottom:10px;"> 
                                                        <span>  Receipt Date : <?php echo date($this->customlib->getSchoolDateFormat()); ?> </span>
                                                        <br>
                                                        <!--<span>Send No: 570/19-20</span>   -->
                                                     </td>
                                                  </tr>
                                                  <tr style="text-align: center;">
                                                     <td colspan="12" style="padding: 8px 0px;">
                                                        <span>Year :<?=$this->setting_model->getCurrentSessionName()?></span>   
                                                        <span style="margin-left:2%;">Courses:<?php echo $student['class']?></span>
                                                     </td>
                                                  </tr>
                                                  <tr >
                                                     <td colspan="" style="padding:10px 5px;border-top:0px solid black;border-bottom:0px solid black;border-left:0px solid black;border-right:0px solid black; ">Student Name: </td>
                                                     <td colspan="5" style="padding:10px 5px;border-top:0px solid black;border-bottom:1px solid black;border-right:0px solid black; "><?php echo $student['firstname'] . " " . $student['lastname'] ?>
                                                     </td>
                                                  </tr>
                                                  <tr >
                                                     <td colspan="" style="padding:10px 5px;border-top:0px solid black;border-bottom:0px solid black;border-left:0px solid black;border-right:0px solid black; ">Father's Name: </td>
                                                     <td colspan="5" style="padding:10px 5px;border-top:0px solid black;border-bottom:1px solid black;border-right:0px solid black; "><?php echo $student['father_name']; ?>
                                                     </td>
                                                  </tr>
                                                  <tr >
                                                     <td colspan="" style="padding:10px 5px;border-top:0px solid black;border-bottom:0px solid black;border-left:0px solid black;border-right:0px solid black; ">Fee Deposite: </td>
                                                     <td colspan="5" style="padding:10px 5px;border-top:0px solid black;border-bottom:1px solid black;border-right:0px solid black; "> <?php echo ($currency_symbol . number_format($total_deposite_amount, 2, '.', ''));?>
                                                     </td>
                                                  </tr>
                                                  <tr>
                                                     <td colspan="" style="padding:10px 5px;border-top:0px solid black;border-bottom:0px solid black;border-left:0px solid black;border-right:0px solid black; ">Fee Dues: </td>
                                                     <td colspan="5" style="padding:2px 5px;border-top:0px solid black;border-bottom:1px solid black;border-right:0px solid black; ">         <?php echo ($currency_symbol . number_format($totaldue_fee2 , 2, '.', ''));  ?>
                                                     
                                                     
                                                       
                                       
                                              
                                                  </tr>
                                                  <tr >
                                                     <td colspan="" style="padding:10px 5px;border-top:0px solid black;border-bottom:0px solid black;border-left:0px solid black;border-right:0px solid black; ">Current Year: </td>
                                                     <td colspan="5" style="padding:2px 5px;border-top:0px solid black;border-bottom:1px solid black;border-right:0px solid black; "><?=$this->setting_model->getCurrentSessionName()?>
                                                     </td>
                                                  </tr>
                                                  <?php
                                                  if($current_year != $past_year->session)
                                                  {
                                                  
                                                  ?>
                                                  <tr >
                                                     <td colspan="" style="padding:10px 5px;border-top:0px solid black;border-bottom:0px solid black;border-left:0px solid black;border-right:0px solid black; ">Previous Year: </td>
                                                     <td colspan="5" style="padding:2px 5px;border-top:0px solid black;border-bottom:1px solid black;border-right:0px solid black; "><?=$past_year->session?>
                                                     </td>
                                                     <?php }?>
                                                  </tr>
                                                  <tr >
                                                     <td colspan="" style="padding:10px 5px;border-top:0px solid black;border-bottom:0px solid black;border-left:0px solid black;border-right:0px solid black; ">Total: </td>
                                                     <td colspan="5" style="padding:2px 5px;border-top:0px solid black;border-bottom:1px solid black;border-right:0px solid black; "><?php
                                                echo ($currency_symbol . number_format($total_amount, 2, '.', ''));
                                                ?>
                                                     </td>
                                                  </tr>
                                                  <!-- table end -->
                                                  <tr style="padding-top:40px; ">
                                                     <td colspan="6" style="padding-top:40px;">
                                                        Student/Gurdian Sign
                                                     </td>
                                                     <td colspan="6" style="padding-top:40px;">
                                                        Accountant Sign
                                                     </td>
                                                  </tr>
                                               </table>
                                            </div>
                                            <!--end new design---->
                                         </tbody>
                                         <!--</table>-->
                                      </div>
                                   </div>
                                </div>
                             </div>
                          </div>
                       </div>
                       <?php
                          } else {
                              
                          }
                          ?>
                    </div>
        </div>
        <!-- /.row -->
    </section>

    <!-- /.content -->
    <div class="clearfix"></div>
</div>


<script type="text/javascript">
    function getSectionByClass(class_id, section_id) {
        if (class_id != "" && section_id != "") {
            $('#section_id').html("");
            var base_url = '<?php echo base_url() ?>';
            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
            $.ajax({
                type: "GET",
                url: base_url + "accountant/sections/getByClass",
                data: {'class_id': class_id},
                dataType: "json",
                success: function (data) {
                    $.each(data, function (i, obj)
                    {
                        var sel = "";
                        if (section_id == obj.section_id) {
                            sel = "selected";
                        }
                        div_data += "<option value=" + obj.section_id + " " + sel + ">" + obj.section + "</option>";
                    });
                    $('#section_id').append(div_data);
                }
            });
        }
    }

    $(document).ready(function () {
        $('.detail_popover').popover({
            placement: 'right',
            title: '',
            trigger: 'hover',
            container: 'body',
            html: true,
            content: function () {
                return $(this).closest('td').find('.fee_detail_popover').html();
            }
        });

        $(document).on('change', '#class_id', function (e) {
            $('#section_id').html("");
            var class_id = $(this).val();
            var base_url = '<?php echo base_url() ?>';
            var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
            $.ajax({
                type: "GET",
                url: base_url + "accountant/sections/getByClass",
                data: {'class_id': class_id},
                dataType: "json",
                success: function (data) {
                    $.each(data, function (i, obj)
                    {
                        div_data += "<option value=" + obj.section_id + ">" + obj.section + "</option>";
                    });
                    $('#section_id').append(div_data);
                }
            });
        });
        $(document).on('change', '#section_id', function (e) {

            getStudentsByClassAndSection();

        });
        var class_id = $('#class_id').val();
        var section_id = '<?php echo set_value('section_id') ?>';
        getSectionByClass(class_id, section_id);
        if (class_id != "" || section_id != "") {
            postbackStudentsByClassAndSection(class_id, section_id);
        }
    });
    function getStudentsByClassAndSection() {

        $('#student_id').html("");
        var class_id = $('#class_id').val();
        var section_id = $('#section_id').val();
        var student_id = '<?php echo set_value('student_id') ?>';
        var base_url = '<?php echo base_url() ?>';
        var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
        $.ajax({
            type: "GET",
            url: base_url + "accountant/student/getByClassAndSection",
            data: {'class_id': class_id, 'section_id': section_id},
            dataType: "json",
            success: function (data) {
                $.each(data, function (i, obj)
                {
                    var sel = "";
                    if (section_id == obj.section_id) {
                        sel = "selected=selected";
                    }
                    div_data += "<option value=" + obj.id + ">" + obj.firstname + " " + obj.lastname + "</option>";
                });
                $('#student_id').append(div_data);
            }
        });
    }

    function postbackStudentsByClassAndSection(class_id, section_id) {
        $('#student_id').html("");
        var student_id = '<?php echo set_value('student_id') ?>';
        var base_url = '<?php echo base_url() ?>';
        var div_data = '<option value=""><?php echo $this->lang->line('select'); ?></option>';
        $.ajax({
            type: "GET",
            url: base_url + "accountant/student/getByClassAndSection",
            data: {'class_id': class_id, 'section_id': section_id},
            dataType: "json",
            success: function (data) {
                $.each(data, function (i, obj)
                {
                    var sel = "";
                    if (student_id == obj.id) {
                        sel = "selected=selected";
                    }
                    div_data += "<option value=" + obj.id + " " + sel + ">" + obj.firstname + " " + obj.lastname + "</option>";
                });
                $('#student_id').append(div_data);
            }
        });
    }
</script>

<script type="text/javascript">

    $(document).ready(function () {
        $('.table-fixed-header').fixedHeader();
    });

//  $(window).on('resize', function () {
//    $('.header-copy').width($('.table-fixed-header').width())
//});

    (function ($) {

        $.fn.fixedHeader = function (options) {
            var config = {
                topOffset: 50
                        //bgColor: 'white'
            };
            if (options) {
                $.extend(config, options);
            }

            return this.each(function () {
                var o = $(this);

                var $win = $(window);
                var $head = $('thead.header', o);
                var isFixed = 0;
                var headTop = $head.length && $head.offset().top - config.topOffset;

                function processScroll() {
                    if (!o.is(':visible')) {
                        return;
                    }
                    if ($('thead.header-copy').size()) {
                        $('thead.header-copy').width($('thead.header').width());
                    }
                    var i;
                    var scrollTop = $win.scrollTop();
                    var t = $head.length && $head.offset().top - config.topOffset;
                    if (!isFixed && headTop !== t) {
                        headTop = t;
                    }
                    if (scrollTop >= headTop && !isFixed) {
                        isFixed = 1;
                    } else if (scrollTop <= headTop && isFixed) {
                        isFixed = 0;
                    }
                    isFixed ? $('thead.header-copy', o).offset({
                        left: $head.offset().left
                    }).removeClass('hide') : $('thead.header-copy', o).addClass('hide');
                }
                $win.on('scroll', processScroll);

                // hack sad times - holdover until rewrite for 2.1
                $head.on('click', function () {
                    if (!isFixed) {
                        setTimeout(function () {
                            $win.scrollTop($win.scrollTop() - 47);
                        }, 10);
                    }
                });

                $head.clone().removeClass('header').addClass('header-copy header-fixed').appendTo(o);
                var header_width = $head.width();
                o.find('thead.header-copy').width(header_width);
                o.find('thead.header > tr:first > th').each(function (i, h) {
                    var w = $(h).width();
                    o.find('thead.header-copy> tr > th:eq(' + i + ')').width(w);
                });
                $head.css({
                    margin: '0 auto',
                    width: o.width(),
                    'background-color': config.bgColor
                });
                processScroll();
            });
        };

    })(jQuery);
    $(document).ready(function () {
        $.extend($.fn.dataTable.defaults, {
            ordering: false,
            paging: false,
            bSort: false,
            info: false
        });
    });
    
//     $(document).ready(function() {
//     $('.example-invoice').DataTable( {
//         dom: 'Bfrtip',
//         buttons: [
//             'copy', 'csv', 'excel', 'pdf', 'print'
//         ]
//     } );
// } );
</script>

