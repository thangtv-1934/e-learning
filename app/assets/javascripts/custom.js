jQuery(document).on('click', '#sidebarToggle', function(){
  let body = jQuery('body');
  if(body.hasClass('sidebar-toggled')){
    body.removeClass('sidebar-toggled');
    jQuery('#accordionSidebar').removeClass('toggled');
  } else {
    body.addClass('sidebar-toggled');
    jQuery('#accordionSidebar').addClass('toggled');
  }
    return false;
});
