#! /usr/bin/lua

local pcsv = require 'physionet_csv'
local pretty = require 'pl.pretty'

waveforms1 = pcsv.read('data/sim/ecg_1')
waveforms2 = pcsv.read('data/sim/ecg_2')

pretty.dump(waveforms1)
pretty.dump(waveforms2)

