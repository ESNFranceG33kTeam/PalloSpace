<?php
// Configure CAS attributes --> roles
add_filter( 'authorizer_custom_role', function ( $default_role, $user_data ) {
	if ( ! empty( $user_data['cas_attributes']['roles'] ) ) {
		if ( in_array('National.webmaster:FR', $user_data['cas_attributes']['extended_roles']) ) {
			$default_role = 'administrator';
		} elseif ( in_array('National.projectCoordinator:FR', $user_data['cas_attributes']['extended_roles']) ) {
			$default_role = 'editor';
		}
	}

	return $default_role;
}, 10, 2 );
?>