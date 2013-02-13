ECG program
###########

Read and display ECG data.



How to specify a source of data
===============================

Data comes into the system either as live data streamed in real time
from a sampling device, as historical data retrieved from an archive, or
test data.

A data source can contain samples for either a single data channel or for
many channels.

For any channel from a live data source, the sample might contain a timestamp,
which is the time the sample was taken. If not, then the time when it is received
is applied to that sample.

The samples can be in engineering units, or in arbitrary units, in which case
an algorithm to convert to engineering units must be provided.

There is no standard streaming or data archival format. It seems that every field of
speciality has created its own format:

* NMEA 0183 and friends for live marine navigation data

* GPX, KML for recorded tracks, routes and waypoints

* PhysioBank archival format at physionet.org for physiological signals

* 



To specify how to retrieve data for a file, we need to know

* what the file format is

* how many channels are available



To retrieve samples from a 
