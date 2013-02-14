#! /usr/bin/env gsl-shell

package.path = package.path .. ';/usr/share/lua/5.1/?.lua'
package.cpath = package.cpath .. ';/usr/lib/x86_64-linux-gnu/lua/5.1/?.so'

local physionet = require 'physionet'

local filename = arg[1] or 'data/sim/ecg_1'
waveforms1 = physionet.read_csv(filename)

--local pretty = require 'pl.pretty'
--pretty.dump(waveforms1)

function graph.tiline(table, a, b)
   return graph.filine(function(i) return table[i] end, a, b)
end


local waveform = waveforms1

local plot = graph.canvas('ECG: ' .. waveform.name)
plot:limits(0, -500, waveform[1].nsamples, 750*12)

for i = 1, waveform.ntraces do
   local line = graph.tiline(waveform[i].samples, 1, waveform[i].nsamples)
   plot:add(line, 'blue', {{'stroke', width=1}, {'translate', x=0, y=0  }, }, {{'translate', x=0, y=(i-1)*750 }, })
end

plot:flush()
plot:show()

while true do
end
