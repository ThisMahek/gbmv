<div class="content-wrapper">
    <section class="content-header">
        <h1>
            <i class="fa fa-money"></i> <?php echo $this->lang->line('fees_collection'); ?></h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <div class="row">           
            <div class="col-md-4">             
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><?php echo $this->lang->line('edit_accountant'); ?></h3>
                    </div> 
                    <form action="<?php echo site_url('admin/accountant/edit/' . $id) ?>"  id="employeeform" name="employeeform" method="post" accept-charset="utf-8"  enctype="multipart/form-data">
                        <div class="box-body">
                            <?php if ($this->session->flashdata('msg')) { ?>
                                <?php echo $this->session->flashdata('msg') ?>
                            <?php } ?>  
                            <?php echo $this->customlib->getCSRF(); ?>
                            <div class="form-group">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('name'); ?></label>
                                <input autofocus="" id="category" name="name" placeholder="" type="text" class="form-control"  value="<?php echo set_value('name', $librarian['name']); ?>" />
                                <span class="text-danger"><?php echo form_error('name'); ?></span>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('email'); ?></label>
                                <input id="category" name="email" placeholder="" type="text" class="form-control"  value="<?php echo set_value('email', $librarian['email']); ?>" />
                                <span class="text-danger"><?php echo form_error('email'); ?></span>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputFile"> <?php echo $this->lang->line('gender'); ?> &nbsp;&nbsp;</label>
                                <select class="form-control" name="gender">
                                    <option value=""><?php echo $this->lang->line('select'); ?></option>
                                    <?php
                                    foreach ($genderList as $key => $value) {
                                        ?>
                                        <option value="<?php echo $key; ?>" <?php if (set_value('gender', $librarian['sex']) == $key) echo "selected"; ?>><?php echo $value; ?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                                <span class="text-danger"><?php echo form_error('gender'); ?></span>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('date_of_birth'); ?></label>
                                  <input id="dob_" name="dob"  type="date" class="form-control"  value="<?php echo date('Y-m-d',strtotime($librarian['dob'])) ?>" max="<?=date('Y-m-d')?>" />
                                <!--<input id="dob" name="dob" placeholder="" type="text" class="form-control"  value="<?php echo set_value('dob', date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($librarian['dob']))); ?>" readonly="readonly"/>-->
                                <span class="text-danger"><?php echo form_error('dob'); ?></span>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('address'); ?></label>
                                <textarea id="address" name="address" placeholder=""  class="form-control" ><?php echo set_value('address', $librarian['address']); ?></textarea>
                                <span class="text-danger"><?php echo form_error('address'); ?></span>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1"><?php echo $this->lang->line('phone'); ?></label>
                                <input id="phone_1" name="phone" placeholder="" type="text" class="form-control"  value="<?php echo set_value('phone', $librarian['phone']); ?>" onkeypress="return (event.charCode > 47 && event.charCode < 58)" maxlength="10" oninput="validateMobile('phone_1','sp_mobile','btn_1')" />
                                <span class="text-danger"><?php echo form_error('phone'); ?></span>
                                 <span id="sp_mobile" style="color:red"></span>
                            </div>
                            <div class="form-group">
                                <label for="father_name"><?php echo $this->lang->line('father_name'); ?></label>
                                <input id="phone" name="father_name" placeholder="" type="text" class="form-control"  value="<?php echo set_value('father_name',$librarian['father_name']); ?>" />
                                <span class="text-danger"><?php echo form_error('father_name'); ?></span>
                            </div>
                            <div class="form-group">
                                <label for="department"><?php echo $this->lang->line('department'); ?>Department</label>
                                <input id="phone" name="department" placeholder="" type="text" class="form-control"  value="<?php echo set_value('department',$librarian['department']); ?>" />
                                <span class="text-danger"><?php echo form_error('department'); ?></span>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputFile"><?php echo $this->lang->line('accountant_photo'); ?> (150px X 150px)</label>
                                <!--<input type='file' name='file' id="file" size='20' />-->
 <input class="filestyle form-control" type='file' name='file' id="file" size='20' />
                            </div>
                        </div>
                        <div class="box-footer">
                            <button type="submit" class="btn btn-info pull-right"><?php echo $this->lang->line('save'); ?></button>
                        </div>
                    </form>
                </div> 
            </div>
            <div class="col-md-8">               
                <div class="box box-primary">
                    <div class="box-header ptbnull">
                        <h3 class="box-title titlefix"><?php echo $this->lang->line('accountant_list'); ?></h3>                       
                    </div>
                    <div class="box-body">
                        <div class="mailbox-controls">                          
                        </div>
                        <div class="table-responsive mailbox-messages">
                            <div class="download_label"><?php echo $this->lang->line('accountant_list'); ?></div>
                            <table class="table table-striped table-bordered table-hover example">
                                <thead>
                                    <tr>

                                        <th><?php echo $this->lang->line('name'); ?></th>
                                        <th><?php echo $this->lang->line('email'); ?></th>
                                        <th><?php echo $this->lang->line('date_of_birth'); ?></th>
                                        <th><?php echo $this->lang->line('phone'); ?></th>
                                        <th class="text-right"><?php echo $this->lang->line('action'); ?></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php if (empty($librarianlist)) {
                                        ?>
                                        <tr>
                                            <td colspan="12" class="text-danger text-center"><?php echo $this->lang->line('no_record_found'); ?></td>
                                        </tr>
                                        <?php
                                    } else {
                                        $count = 1;
                                        foreach ($librarianlist as $librarian) {
                                            ?>
                                            <tr>

                                                <td class="mailbox-name"> <?php echo $librarian['name'] ?></td>
                                                <td class="mailbox-name"> <?php echo $librarian['email'] ?></td>
                                                <td class="mailbox-name"> <?php echo date($this->customlib->getSchoolDateFormat(), $this->customlib->dateyyyymmddTodateformat($librarian['dob'])); ?></td>
                                                <td class="mailbox-name"> <?php echo $librarian['phone'] ?></td>
                                                <td class="mailbox-date pull-right">
                                                    <a href="<?php echo base_url(); ?>admin/accountant/view/<?php echo $librarian['id'] ?>" class="btn btn-default btn-xs"  data-toggle="tooltip" title="<?php echo $this->lang->line('show'); ?>">
                                                        <i class="fa fa-list"></i>
                                                    </a>
                                                    <a href="<?php echo base_url(); ?>admin/accountant/edit/<?php echo $librarian['id'] ?>" class="btn btn-default btn-xs"  data-toggle="tooltip" title="<?php echo $this->lang->line('edit'); ?>">
                                                        <i class="fa fa-pencil"></i>
                                                    </a>
                                                    <a href="<?php echo base_url(); ?>admin/accountant/delete/<?php echo $librarian['id'] ?>"class="btn btn-default btn-xs"  data-toggle="tooltip" title="<?php echo $this->lang->line('delete'); ?>" onclick="return confirm('Are you sure you want to delete this item?')";>
                                                        <i class="fa fa-remove"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <?php
                                        }
                                        $count++;
                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </section>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        var date_format = '<?php echo $result = strtr($this->customlib->getSchoolDateFormat(), ['d' => 'dd', 'm' => 'mm', 'Y' => 'yyyy',]) ?>';
        $('#dob,#admission_date').datepicker({
            format: date_format,
            autoclose: true
        });
    });
</script>
<script>
function validateMobile(field,msg,btn)
{

        var adVal = $("#"+field).val();
      
        var sp3 = document.getElementById(msg);
        
        var regad = /[6789]{1}[0-9]{9}/;
        if (regad.test(adVal)==true) 
        {
            sp3.innerHTML=("");
            sp3.style.color="";
            document.getElementById(btn).disabled=false;
        } 
        else 
        {
            sp3.innerHTML="Invalid Mobile Number";
            sp3.style.color="red";
            document.getElementById(btn).disabled=true;
            
        }
        }
</script>
