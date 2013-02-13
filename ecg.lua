#! /usr/bin/lua

local physionet = require 'physionet'
local pretty = require 'pl.pretty'

waveforms1 = physionet.read_csv('data/sim/ecg_1')
waveforms2 = physionet.read_csv('data/sim/ecg_2')

pretty.dump(waveforms1)
pretty.dump(waveforms2)

