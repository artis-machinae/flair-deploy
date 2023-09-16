# flair-deploy
scripting to automate custom software installation from the network
***********************************************************************************************************
BSD 3-Clause License

Copyright (c) 2002, 2019 artis-machinae.github.io

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

***********************************************************************************************************
TL;DR:
Instead of clicking or typing excessively to multiple different network locations where the install files live - 50 times for a department-specific install, use this script.

GENERAL OVERVIEW:

This is for system deployment scenarios, where one department in an org may need a specific software suite installed en masse.
Rather than create multiple specfic OS images, the base image is installed on each system, and customized as needed.

Servers where installation files live on the internal network are mapped. This prevents issues where a network location is called, but not reachable (for various reasons).
Installation executables for applications are then initiated, in sequence.
This is easily customizable for as many or as few applications as you need.


USAGE INSTRUCTIONS:

1) change the IP address of the servers under the mapping procedures at the beginning to where your desired installation files live on the network
2) change the directories for said servers to navigate to the installation file directories as required
3) automation of the exact application installation is entirely dependant on said file; e.g.: some msi files will be configured to require zero interaction.


FAQ:

Q: What is the point of this?

A: In large organizations, multiple departments need very different suites of software specific to their job duties. Accounting needs one suite, marketing another, etc.


Q: Will my network handle this?

A: Talk to your network team. See if they want you to stick to certain timeframes, etc.


Q: Why is this a batch file? Why not PowerShell?

A: There's nothing wrong with PowerShell. I'm a minimalist, and this works just fine. i.e., why take the sports car to the grocery store to buy a loaf of bread? 


Q: How do I make this install things on silent mode / no interaction required?

A: That is dependent on your command and the executable. Look into msiexec for msi files and the optional switches such as /quiet /qn , etc.


Q: This is not working for my installs. What do I do?

A: That's very vague, but check your mapping in the beginning of the script. Make sure you can ping the IP of the server where the executable files live, and verify the directories on said server. This is the number one issue I've encountered (usually someone moved something on the server... or once someone had even re-IPd the server).


Q: My users like to map drives and some might have the "Y:" drive already assigned.

A: This is an example script. I've used it many times over the past decades, and customize it to each scenario. I encourage you to play with this and come up with solutions for your needs, such as variables and for loops.


Q: Can you help me make this work on my network?

A: No (unless you want to discuss rates) - contact me through artis-machinae.github.io
There is also loads of great documentation available on the web. I have faith you can figure it out.
