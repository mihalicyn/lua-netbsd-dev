print("read_all.lua test started");
testfile = "/root/dev/ioperf/testfiles/libs_port.patch"
steps = 40000

f = io.open(testfile, 'r')

function fsop()
    f:seek('set', 0)
    s = f:read('all')
end

starttime = os.clock()
for i=1,steps
do
    fsop()
end
endtime = (os.clock() - starttime)

print("file content length: " .. s:len())
--print(s)
f:close()

print("read_all.lua test finished. os.clock() diff " .. endtime)
