<?php

function cod_install_tasks($install_state) {
  $tasks = array();

  //make sure we have more memory than 196M. if not lets try to increase it.
  if (ini_get('memory_limit') != '-1' && ini_get('memory_limit') <= '196M') {
    ini_set('memory_limit', '196M');
  }

}

/**
 * Helper function defines the COD modules. -- will use this later so people can select COD features on install. Not useful right now
 */
function _cod_profile_modules() {
  return array(
    'cod_base',
    'cod_session',
    'cod_events',
    'cod_community',
    'cod_front_page',
    'cod_news',
    'cod_sponsors',
  );
}

/**
 * Implements hook_form_alter().
 * Set COD as the default profile.
 * (copied from Atrium: We use system_form_form_id_alter, otherwise we cannot alter forms.)
 */
function system_form_install_select_profile_form_alter(&$form, $form_state) {
  foreach ($form['profile'] as $key => $element) {
    $form['profile'][$key]['#value'] = 'cod';
  }
}