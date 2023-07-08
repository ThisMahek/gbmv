<?php
$currency_symbol = $this->customlib->getSchoolCurrencyFormat();
?>
<div class="content-wrapper" style="min-height: 946px;">
    <section class="content-header">
        <h1>
            <i class="fa fa-money"></i> <?php echo $this->lang->line('fees_collection'); ?></h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-search"></i>                          
                            <?php echo $this->lang->line('search'); ?>
                            <?php echo $this->lang->line('fees'); ?>
                            <?php echo $this->lang->line('payment'); ?>
                        </h3>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-12">
                            <div class="col-md-6">
                                <form role="form" action="<?php echo site_url('studentfee/searchpayment') ?>" method="post" class="form-inline">
                                    <?php echo $this->customlib->getCSRF(); ?>
                                    <div class="form-group">
                                        <div class="col-sm-">
                                            <label><?php echo $this->lang->line('payment_id'); ?>
                                            </label>
                                            <input autofocus="" id="paymentid" name="paymentid" placeholder="" type="text" class="form-control date"  value="<?php echo set_value('paymentid'); ?>"/>
                                            <span class="text-danger"><?php echo form_error('paymentid'); ?></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-3">
                                            <button type="submit" name="search" value="search_filter" class="btn btn-primary btn-sm checkbox-toggle mmius15"><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-6">
                                <form role="form" action="<?php echo site_url('studentfee/searchpaymentbydate') ?>" method="post" class="form-inline">
                                    <?php echo $this->customlib->getCSRF(); ?>
                                    <div class="form-group">
                                        <div class="col-sm-">
                                            <label><?php echo 'Payment Date';//$this->lang->line('payment_date'); ?>
                                            </label>
                                            <input autofocus="" id="paymentdate" name="paymentdate" placeholder="" type="date" class="form-control date"  value="<?php echo set_value('paymentdate'); ?>"/>
                                            <span class="text-danger"><?php echo form_error('paymentdate'); ?></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-3">
                                            <button type="submit" name="search1" value="search_filter" class="btn btn-primary btn-sm checkbox-toggle mmius15"><i class="fa fa-search"></i> <?php echo $this->lang->line('search'); ?></button>
                                        </div>
                                    </div>
                                </form>
                            </div>                            
                            </div>
                        </div>
                    </div>
                </div>
                <?php if (isset($feeLists)) {
                    ?>
                    <div class="box box-info">
                        <div class="box-header ptbnull">
                            <h3 class="box-title titlefix"><i class="fa fa-money"></i> <?php echo 'Payment Details';$this->lang->line('payment_detail'); ?></h3>
                            <div class="box-tools pull-right">
                            </div>
                        </div>
                        <div class="box-body table-responsive">


                            <table class="table table-striped table-bordered table-hover example">
                                <thead>
                                    <tr>
                                        <th><?php echo $this->lang->line('payment_id'); ?></th>
                                        <th><?php echo $this->lang->line('date'); ?></th>
                                        <th><?php echo $this->lang->line('name'); ?></th>
                                        <th><?php echo $this->lang->line('class'); ?></th>
                                        <th><?php echo $this->lang->line('fees_group'); ?></th>
                                        <th><?php echo $this->lang->line('fee_type'); ?></th>
                                        <th><?php echo $this->lang->line('mode'); ?></th>
                                        <th class="text text-right"><?php echo $this->lang->line('amount'); ?></th>
                                        <th class="text text-right"><?php echo $this->lang->line('discount'); ?></th>
                                        <th class="text text-right"><?php echo $this->lang->line('fine'); ?></th>

                                        <th class="text text-right"><?php echo $this->lang->line('action'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $amount = 0;
                                    $discount = 0;
                                    $fine = 0;
                                    $grd_amount = 0;
                                    $grd_discount = 0;
                                    $grd_fine = 0;
                                    $total = 0;
                                    $grd_total = 0;
                                    if (empty($feeLists)) {
                                        ?>
                                        <?php
                                    } else {
                                        $count = 1;
                                        
                                        //print_r($feeList);
                                        //exit();
                                        foreach($feeLists as $feeList):
                                            $feeList = (object)$feeList;
                                            //print_r($feeList);
                                        ?>
                                        <tr>
                                            <td>
                                                <?php echo $feeList->id . "/" . $feeList->inv_no; ?>
                                            </td>
                                            <td>
                                                <?php echo $feeList->date; ?>
                                            </td> 
                                            <td>
                                                <?php echo $feeList->firstname . " " . $feeList->lastname; ?>
                                            </td> 
                                            <td>
                                                <?php echo $feeList->class . " (" . $feeList->section . ")"; ?>
                                            </td> 
                                            <td>
                                                <?php echo $feeList->name; ?>
                                            </td>
                                            <td>
                                                <?php echo $feeList->code; ?>
                                            </td>
                                            <td>
                                                <?php echo $feeList->payment_mode; ?>
                                            </td>
                                            <td class="text text-right">
                                                <?php
                                                $amount = number_format($feeList->amount, 2, '.', '');
                                                echo $currency_symbol . $amount;
                                                ?>
                                            </td>
                                            <td class="text text-right">
                                                <?php
                                                $amount_discount = number_format($feeList->amount_discount, 2, '.', '');
                                                echo $currency_symbol . $amount_discount;
                                                ?>
                                            </td>
                                            <td class="text text-right">
                                                <?php
                                                $amount_fine = number_format($feeList->amount_fine, 2, '.', '');
                                                echo $currency_symbol . $amount_fine;
                                                ?>
                                            </td>
                                            <td class="text text-right">
                                                <a href="<?php echo base_url() ?>studentfee/addfee/<?php echo $feeList->student_id ?>" class="btn btn-primary btn-xs" data-toggle="tooltip" title="<?php echo $this->lang->line('view'); ?>" data-original-title="<?php echo $this->lang->line('view'); ?>">
                                                    <i class="fa fa-list-alt"></i> <?php echo $this->lang->line('view'); ?>
                                                </a>
                                            </td>
                                        </tr>
                                        <?php
                                        $grd_amount += $amount;
                                        $grd_discount += $discount;
                                        $grd_fine += $fine;
                                    
                                        endforeach;
                                    }
                                    ?>
                                    <tr class="box box-solid total-bg">             <td></td>
                                            <td></td> 
                                            <td></td> 
                                            <td></td> 
                                            <td></td>
                                            <td class="text text-right">&nbsp;</td>
                                            <td class="text text-right">
                                                <?php echo $this->lang->line('grand_total'); ?>
                                            </td>
                                            <td class="text text-right">
                                                <?php echo ($currency_symbol . number_format($grd_amount, 2, '.', '') ); ?>
                                            </td>
                                            <td class="text text-right">
                                                <?php echo ($currency_symbol . number_format($grd_discount, 2, '.', '') ); ?>
                                            </td>
                                            <td class="text text-right">
                                                <?php echo ($currency_symbol . number_format($grd_fine, 2, '.', '') ); ?>
                                            </td> 

                                            <td class="text text-right">
                                                <?php echo ($currency_symbol . number_format(($grd_fine + ($grd_amount - $grd_discount)), 2, '.', '')); ?>
                                            </td>
                                        </tr>
                                </tbody>
                            </table>

                        </div>

                    </div>
                    <?php
                }
                ?>
            </div>
        </div> 
    </section>
</div>