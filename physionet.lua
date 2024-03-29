#! /usr/bin/lua

-- Read a bunch of samples from a physionet data file in CSV format.
local re = require 're'
--local pretty = require 'pl.pretty'

local function read_hea(name)
   local prefix, basename = name:match('(.*/)(.+)')
   local hea_filename = name .. '.hea'
   
   local hea_pattern = re.compile([[
      file <- ( header ( NL wavespec ) + ) -> {}
      header <- ( {:name: %S+ :} %s+ {:ntraces: %d+ :} %s+ {:sample_rate: %d+ :} %s+ {:nsamples: %d+ :} )
      
      wavespec <- ( {:filename: %S+ :} %s+ {:encoding: %S+ :} %s+ {:a: %S+ :} %s+ {:b: %S+ :} %s+ {:c: %S+ :} %s+ {:initial_value: %S+ :} %s+ {:fchecksum: %S+ :} %s+ {:f: %S+ :} %s+ {:name: %S+ :} ) -> {}
      
      NL <- . %nl
   ]])
   
   local f = io.open(hea_filename)
   local c = f:read('*a')
   local waveforms = hea_pattern:match(c)
   
   return waveforms
end


local function read_csv(name)
   local waveforms = read_hea(name)

   for _, waveform in ipairs(waveforms) do
      --print(waveform.name)
      waveform.samples = {}
      waveform.nsamples = 0
      waveform.sample_rate = tonumber(waveforms.sample_rate)
      waveform.c_checksum = 0
   end

   csv_filename = name .. '.txt'

   for l in io.lines(csv_filename) do
      local a
      local b = 1
      local value

      for i = 1, waveforms.ntraces do
         local waveform = waveforms[i]
         a, b, value = string.find(l, '([^,]+),?', b)
         waveform.samples[#waveform.samples+1] = tonumber(value)
         waveform.c_checksum = waveform.c_checksum + tonumber(value)
      end
   end

   for _, waveform in ipairs(waveforms) do
      waveform.nsamples = #waveform.samples
   end

   
   return waveforms
end



local M = {}

M.read_csv = read_csv

return M

