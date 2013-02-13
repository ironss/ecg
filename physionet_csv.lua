#! /usr/bin/lua

-- Read a bunch of samples from a physionet data file in CSV format.
re = require 're'
pretty = require 'pl.pretty'

local function read(name)
   local prefix, basename = name:match('(.*/)(.+)')
   local hea_name = name .. '.hea'
   
   pattern = re.compile([[
      file <- ( header ( NL wavespec ) + ) -> {}
      header <- ( {:name: %S+ :} %s+ {:ntraces: %d+ :} %s+ {:sample_rate: %d+ :} %s+ {:nsamples: %d+ :} )
      
      wavespec <- ( {:filename: %S+ :} %s+ {:encoding: %S+ :} %s+ {:a: %S+ :} %s+ {:b: %S+ :} %s+ {:c: %S+ :} %s+ {:d: %S+ :} %s+ {:e: %S+ :} %s+ {:f: %S+ :} %s+ {:name: %S+ :} ) -> {}
      
      NL <- . %nl
   ]])
   
   print(prefix, name, hea_name)
   local f = io.open(hea_name)
   c = f:read('*a')
   a = pattern:match(c)
   pretty.dump(a)
end




waveforms = read('data/sim/ecg_1')

