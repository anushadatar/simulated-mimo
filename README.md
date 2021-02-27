# Simulated MIMO
*Mark Goldwater and Anusha Datar*

Olin College SP21 Principles of Wireless Communications Lab 2a.
# Summary
This repository contains code and documentation associated with
decoding signals sent and received by a MIMO system with 2 transmitting antennas
and two receiving antennas.
We decoded the data provided in class (included in the file [2User2Antenna.mat](https://github.com/anushadatar/simulated-mimo/blob/main/2User2AntennaBS.mat))
using both a zero-forcing receiver and an MMSE receiver.

The main function associated with the decoding the data with the
zero-forcing receiver is [zero_forcing_receiver.m](https://github.com/anushadatar/simulated-mimo/blob/main/zero_forcing_receiver.m).
The main function associated with decoding the data with the MMSE
receiver is [mmse_receiver.m](https://github.com/anushadatar/simulated-mimo/blob/main/mmse_receiver.m).
Both of these functions call many modular functions included in this directory.

Our [final report](https://github.com/anushadatar/usrp-qpsk/blob/main/docs/report.pdf) includes more details about our implementation
and additional theoretical background.
