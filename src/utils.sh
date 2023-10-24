#!/usr/bin/env bash
#
get_tmux_option() {
	local option=$1
	local default_value=$2
	local -r option_value=$(tmux show-option -gqv "$option")

	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

function generate_left_side_string() {
	local separator_end="#[bg=${PALETTE[bg_highlight]}]#{?client_prefix,#[fg=${PALETTE[yellow]}],#[fg=${PALETTE[green]}]}${left_separator:?}#[none]"

	echo "#[fg=${PALETTE[fg_gutter]},bold]#{?client_prefix,#[bg=${PALETTE[yellow]}],#[bg=${PALETTE[green]}]}  #S ${separator_end}"
}

function generate_inactive_window_string() {
	local separator_start="#[bg=${PALETTE['dark5']},fg=${PALETTE['bg_highlight']}]${left_separator:?}#[none]"
	local separator_internal="#[bg=${PALETTE['dark3']},fg=${PALETTE['dark5']}]${left_separator:?}#[none]"
	local separator_end="#[bg=${PALETTE[bg_highlight]},fg=${PALETTE['dark3']}]${left_separator:?}#[none]"

	echo "${separator_start}#[fg=${PALETTE[white]}]#I${separator_internal}#[fg=${PALETTE[white]}] #{?window_zoomed_flag, , }#W ${separator_end}"
}

function generate_active_window_string() {
	separator_start="#[bg=${PALETTE['magenta']},fg=${PALETTE['bg_highlight']}]${left_separator:?}#[none]"
	separator_internal="#[bg=${PALETTE['purple']},fg=${PALETTE['magenta']}]${left_separator:?}#[none]"
	separator_end="#[bg=${PALETTE[bg_highlight]},fg=${PALETTE['purple']}]${left_separator:?}#[none]"

	echo "${separator_start}#[fg=${PALETTE[white]}]#I${separator_internal}#[fg=${PALETTE[white]}] #{?window_zoomed_flag, , }#W ${separator_end}#[none]"
}
