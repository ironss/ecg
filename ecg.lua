#! /usr/bin/env gsl-shell

package.path = package.path .. ';/usr/share/lua/5.1/?.lua'
package.cpath = package.cpath .. ';/usr/lib/x86_64-linux-gnu/lua/5.1/?.so'

local physionet = require 'physionet'
local pretty = require 'pl.pretty'

waveforms1 = physionet.read_csv('data/sim/ecg_1')
waveforms2 = physionet.read_csv('data/sim/ecg_2')

if pretty ~= nil then
--   pretty.dump(waveforms1)
--   pretty.dump(waveforms2)
end


function graph.tiplot(table, a, b, color)
   return graph.fiplot(function(i) return table[i] end, a, b, color)
end


p = graph.tiplot(waveforms1[1].samples, 1, waveforms1[1].nsamples, red)
p:show()


while true do
end
