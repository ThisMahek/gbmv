<?php 


 
    function check_edit($role, $slug_name)
    {
        
                $CI = get_instance();
                $module_data= $CI->db->where('operation_slug',$slug_name)->get('operations')->row();
                $role_data=  $CI->db->where('name',$role)->get('role')->row();
                $privileges_data=  $CI->db->where(['operation_id'=>$module_data->id,'role_id'=>$role_data->id])->get('privileges')->row();
                $edit_value= $privileges_data->is_edit;
                return $edit_value;
        
    }
     function check_delete($role, $slug_name)
    {
        
                $CI = get_instance();
                $module_data= $CI->db->where('operation_slug',$slug_name)->get('operations')->row();
                $role_data=  $CI->db->where('name',$role)->get('role')->row();
                $privileges_data=  $CI->db->where(['operation_id'=>$module_data->id,'role_id'=>$role_data->id])->get('privileges')->row();
                $delete_value= $privileges_data->is_delete;
                return $delete_value;
        
    }
?>