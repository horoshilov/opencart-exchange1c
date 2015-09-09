<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-banner" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
      <div class="panel panel-default">
          <div class="panel-heading">
              <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
          </div>
          <div class="panel-body">
              <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
                  <ul class="nav nav-tabs">
                      <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $text_tab_general; ?></a></li>
                      <li><a href="#tab-product" data-toggle="tab"><?php echo $text_tab_product; ?></a></li>
                      <li><a href="#tab-order" data-toggle="tab"><?php echo $text_tab_order; ?></a></li>
                      <li><a href="#tab-manual" data-toggle="tab"><?php echo $text_tab_manual; ?></a></li>
                  </ul>
                  <div class="tab-content">
                    <div class="tab-pane active" id="tab-general">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="exchange1c_username"><?php echo $entry_username; ?></label>
                            <div class="col-sm-10">
                                <input name="exchange1c_username" type="text" value="<?php echo $exchange1c_username; ?>" id="exchange1c_username" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="exchange1c_password"><?php echo $entry_password; ?></label>
                            <div class="col-sm-10">
                                <input name="exchange1c_password" type="password" value="<?php echo $exchange1c_password; ?>" id="exchange1c_password" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="exchange1c_status"><?php echo $entry_status; ?></label>
                            <div class="col-sm-10">
                                <select name="exchange1c_status" id="exchange1c_status" class="form-control">
                                    <?php if ($exchange1c_status) { ?>
                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                    <option value="1"><?php echo $text_enabled; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="exchange1c_allow_ip"><?php echo $entry_allow_ip; ?></label>
                            <div class="col-sm-10">
                                <textarea name="exchange1c_allow_ip" style="width: 200px; height: 50px;" id="exchange1c_allow_ip" /><?php echo $exchange1c_allow_ip; ?></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab-product">
                        <div class="table-responsive">
                            <table id="exchange1c_price_type_id" class="table table-striped table-bordered table-hover">
                                <thead>
                                  <tr>
                                    <td class="left"><?php echo $entry_config_price_type; ?></td>
                                    <td class="left"><?php echo $entry_customer_group; ?></td>
                                    <td class="right"><?php echo $entry_quantity; ?></td>
                                    <td class="right"><?php echo $entry_priority; ?></td>
                                    <td></td>
                                  </tr>
                                </thead>
                                <tbody>
                                    <?php $price_row = 0; ?>
                                    <?php foreach ($exchange1c_price_type as $obj) { ?>
                                    <?php if ($price_row == 0) {?>
                                        <tr id="exchange1c_price_type_row<?php echo $price_row; ?>">
                                            <td class="left"><input type="text" name="exchange1c_price_type[<?php echo $price_row; ?>][keyword]" value="<?php echo $obj['keyword']; ?>" /></td>
                                            <td class="left"><?php  echo $text_price_default; ?><input type="hidden" name="exchange1c_price_type[<?php echo $price_row; ?>][customer_group_id]" value="0" /></td>
                                            <td class="center">-<input type="hidden" name="exchange1c_price_type[<?php echo $price_row; ?>][quantity]" value="0" /></td>
                                            <td class="center">-<input type="hidden" name="exchange1c_price_type[<?php echo $price_row; ?>][priority]" value="0" /></td>
                                            <td class="left">&nbsp;</td>
                                        </tr>
                                    <?php } else { ?>
                                      <tr id="exchange1c_price_type_row<?php echo $price_row; ?>">
                                        <td class="left"><input type="text" name="exchange1c_price_type[<?php echo $price_row; ?>][keyword]" value="<?php echo $obj['keyword']; ?>" /></td>
                                        <td class="left"><select name="exchange1c_price_type[<?php echo $price_row; ?>][customer_group_id]">
                                          <?php foreach ($customer_groups as $customer_group) { ?>
                                            <?php if ($customer_group['customer_group_id'] == $obj['customer_group_id']) { ?>
                                              <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                                            <?php } else { ?>
                                              <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                                            <?php } ?>
                                          <?php } ?>
                                          </select></td>
                                        <td class="center"><input type="text" name="exchange1c_price_type[<?php echo $price_row; ?>][quantity]" value="<?php echo $obj['quantity']; ?>" size="2" /></td>
                                        <td class="center"><input type="text" name="exchange1c_price_type[<?php echo $price_row; ?>][priority]" value="<?php echo $obj['priority']; ?>" size="2" /></td>
                                        <td class="center"><a onclick="$('#exchange1c_price_type_row<?php echo $price_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
                                      </tr>
                                    <?php } ?>
                                    <?php $price_row++; ?>
                                  <?php } ?>
                                </tbody>
                            <tfoot>
                              <tr>
                                <td colspan="4"></td>
                                  <td class="text-left"><button type="button" onclick="addDiscount();" data-toggle="tooltip" title="<?php echo $button_discount_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
                                </tr>
                            </tfoot>
                            </table>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="exchange1c_flush_product"><?php echo $entry_flush_product; ?></label>
                            <div class="col-sm-10">
                                <input name="exchange1c_flush_product" type="checkbox" value="1" id="exchange1c_flush_product" <?php echo ($exchange1c_flush_product == 1)? 'checked' : ''; ?>/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="exchange1c_flush_category"><?php echo $entry_flush_category; ?></label>
                            <div class="col-sm-10">
                                <input name="exchange1c_flush_category" type="checkbox" value="1" id="exchange1c_flush_category" <?php echo ($exchange1c_flush_category == 1)? 'checked' : ''; ?>/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="exchange1c_flush_manufacturer"><?php echo $entry_flush_manufacturer; ?></label>
                            <div class="col-sm-10">
                                <input name="exchange1c_flush_manufacturer" type="checkbox" value="1" id="exchange1c_flush_manufacturer" <?php echo ($exchange1c_flush_manufacturer == 1)? 'checked' : ''; ?>/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="exchange1c_flush_attribute"><?php echo $entry_flush_attribute; ?></label>
                            <div class="col-sm-10">
                                <input name="exchange1c_flush_attribute" type="checkbox" value="1" id="exchange1c_flush_attribute" <?php echo ($exchange1c_flush_attribute == 1)? 'checked' : ''; ?>/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="exchange1c_flush_quantity"><?php echo $entry_flush_quantity; ?></label>
                            <div class="col-sm-10">
                                <input name="exchange1c_flush_quantity" type="checkbox" value="1" id="exchange1c_flush_quantity" <?php echo ($exchange1c_flush_quantity == 1)? 'checked' : ''; ?>/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="exchange1c_fill_parent_cats"><?php echo $entry_fill_parent_cats; ?></label>
                            <div class="col-sm-10">
                                <input name="exchange1c_fill_parent_cats" type="checkbox" value="1" id="exchange1c_fill_parent_cats" <?php echo ($exchange1c_fill_parent_cats == 1)? 'checked' : ''; ?>/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="exchange1c_relatedoptions"><?php echo $entry_relatedoptions; ?></label>
                            <div class="col-sm-10">
                                <input name="exchange1c_relatedoptions" type="checkbox" value="1" id="exchange1c_relatedoptions" <?php echo ($exchange1c_relatedoptions == 1)? 'checked' : ''; ?>/>
                                <span class="help"><?php echo $entry_relatedoptions_help; ?></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="exchange1c_dont_use_artsync"><?php echo $entry_dont_use_artsync; ?></label>
                            <div class="col-sm-10">
                                <input name="exchange1c_dont_use_artsync" type="checkbox" value="1" id="exchange1c_dont_use_artsync" <?php echo ($exchange1c_dont_use_artsync == 1)? 'checked' : ''; ?>/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="exchange1c_seo_url"><?php echo $entry_seo_url; ?></label>
                            <div class="col-sm-10">
                                <select name="exchange1c_seo_url" class="form-control" id="exchange1c_seo_url">
                                    <option value="0" <?php echo ($exchange1c_seo_url == 0) ? 'selected' : '' ;?>><?php echo $text_disabled; ?></option>
                                    <option value="1" <?php echo ($exchange1c_seo_url == 1) ? 'selected' : '' ;?>><?php echo $entry_seo_url_deadcow; ?></option>
                                    <option value="2" <?php echo ($exchange1c_seo_url == 2) ? 'selected' : '' ;?>><?php echo $entry_seo_url_translit; ?></option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="exchange1c_full_log"><?php echo $entry_full_log; ?></label>
                            <div class="col-sm-10">
                                <input name="exchange1c_full_log" type="checkbox" value="1" id="exchange1c_full_log" <?php echo ($exchange1c_full_log == 1)? 'checked' : ''; ?>/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="exchange1c_apply_watermark"><?php echo $entry_apply_watermark; ?></label>
                            <div class="col-sm-10">
                                <input name="exchange1c_apply_watermark" type="checkbox" value="1" id="exchange1c_apply_watermark" <?php echo ($exchange1c_apply_watermark == 1)? 'checked' : ''; ?>/>
                                <div class="image"><img src="<?php echo $thumb; ?>" alt="" id="thumb" />
                                    <input type="hidden" name="exchange1c_watermark" value="<?php echo $exchange1c_watermark; ?>" id="image" />
                                    <br /><a onclick="image_upload('image', 'thumb');">
                                        <?php echo $text_browse; ?>
                                    </a>
                                    &nbsp;&nbsp;|&nbsp;&nbsp;
                                    <a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');">
                                        <?php echo $text_clear; ?>
                                    </a>
                                </div>
                                <?php if ($error_image) { ?>
                                <span class="error"><?php echo $error_image; ?></span>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                  <div class="tab-pane" id="tab-order">
                      <div class="form-group">
                          <label class="col-sm-2 control-label" for="exchange1c_order_status_to_exchange"><?php echo $entry_order_status_to_exchange; ?></label>
                          <div class="col-sm-10">
                              <select name="exchange1c_order_status_to_exchange" class="form-control" id="exchange1c_order_status_to_exchange">
                              <option value="0" <?php echo ($exchange1c_order_status_to_exchange == 0)? 'selected' : '' ;?>><?php echo $entry_order_status_to_exchange_not; ?></option>
                                <?php foreach ($order_statuses as $order_status) { ?>
                                <option value="<?php echo $order_status['order_status_id'];?>" <?php echo ($exchange1c_order_status_to_exchange == $order_status['order_status_id'])? 'selected' : '' ;?>><?php echo $order_status['name']; ?></option>
                                <?php } ?>
                              </select>
                              </div>
                          </div>
                      <div class="form-group">
                          <label class="col-sm-2 control-label" for="exchange1c_order_status"><?php echo $entry_order_status; ?></label>
                          <div class="col-sm-10">
                              <select name="exchange1c_order_status" class="form-control" id="exchange1c_order_status">
                              <?php foreach ($order_statuses as $order_status) { ?>
                              <option value="<?php echo $order_status['order_status_id'];?>" <?php echo ($exchange1c_order_status == $order_status['order_status_id'])? 'selected' : '' ;?>><?php echo $order_status['name']; ?></option>
                              <?php } ?>
                              </select>
                              </div>
                          </div>
                      <div class="form-group">
                          <label class="col-sm-2 control-label" for="exchange1c_order_currency"><?php echo $entry_order_currency; ?></label>
                          <div class="col-sm-10">
                              <input name="exchange1c_order_currency" type="text" value="<?php echo $exchange1c_order_currency; ?>" id="exchange1c_order_currency" />
                          </div>
                      </div>
                      <div class="form-group">
                          <label class="col-sm-2 control-label" for="exchange1c_order_notify"><?php echo $entry_order_notify; ?></label>
                          <div class="col-sm-10">
                              <input name="exchange1c_order_notify" type="checkbox" value="1" id="exchange1c_order_notify" <?php echo ($exchange1c_order_notify == 1)? 'checked' : ''; ?>/>
                          </div>
                      </div>
                  </div>
                  <div class="tab-pane" id="tab-manual">

          <table class="form">
            <tr>
              <td>
                <?php echo $entry_upload; ?>
              </td>
              <td>
                <a id="button-upload" class="button"><?php echo $button_upload; ?></a>
              </td>
              <td>
                <?php echo $text_max_filesize; ?>
              </td>
            </tr>
          </table>
        </div>

      </form>

    </div>

    <div style="text-align:center; opacity: .5">
      <p><?php echo $version; ?> | <a href=https://github.com/zenwalker/opencart-exchange1c><?php echo $source_code; ?></a> <a href="http://zenwalker.ru/lab/opencart-exchange1c"><?php echo $text_homepage; ?></a></p>
    </div>
  </div>
</div>
</div>


<script type="text/javascript" src="view/javascript/jquery/ajaxupload.js"></script> 
<script type="text/javascript"><!--
new AjaxUpload('#button-upload', {
  action: 'index.php?route=module/exchange1c/manualImport&token=<?php echo $token; ?>',
  name: 'file',
  autoSubmit: true,
  responseType: 'json',
  onSubmit: function(file, extension) {
    $('#button-upload').after('<img src="view/image/loading.gif" class="loading" style="padding-left: 5px;" />');
    $('#button-upload').attr('disabled', true);
  },
  onComplete: function(file, json) {
    $('#button-upload').attr('disabled', false);
    $('.loading').remove();

    if (json['success']) {
      alert(json['success']);
    }

    if (json['error']) {
      alert(json['error']);
    }
  }
});
//--></script>
<script type="text/javascript"><!--
var price_row = <?php echo $price_row; ?>;

function addConfigPriceType() {
    html  = '';
    html += '  <tr id="exchange1c_price_type_row' + price_row + '">'; 
    html += '    <td class="left"><input type="text" name="exchange1c_price_type[' + price_row + '][keyword]" value="" /></td>';
    html += '    <td class="left"><select name="exchange1c_price_type[' + price_row + '][customer_group_id]">';
    <?php foreach ($customer_groups as $customer_group) { ?>
    html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>';
    <?php } ?>
    html += '    </select></td>';
    html += '    <td class="center"><input type="text" name="exchange1c_price_type[' + price_row + '][quantity]" value="0" size="2" /></td>';
    html += '    <td class="center"><input type="text" name="exchange1c_price_type[' + price_row + '][priority]" value="0" size="2" /></td>';
    html += '    <td class="center"><a onclick="$(\'#exchange1c_price_type_row' + price_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
    html += '  </tr>';

    $('#exchange1c_price_type_id tfoot').before(html);

    $('#config_price_type_row' + price_row + ' .date').datepicker({dateFormat: 'yy-mm-dd'});
    price_row++;
}
//--></script>
<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();

	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');

	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
					dataType: 'text',
					success: function(data) {
						$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script>

<?php echo $footer; ?>
