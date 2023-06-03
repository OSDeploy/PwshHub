Scripts in this directory should be run in WinPE
A good way to ensure in WinPE is to use the following to wrap your code in

if ($env:SystemDrive -eq 'X:') {
    # Put your code in here
}