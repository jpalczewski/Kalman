import platform, os, glob

#Lokalizacja biblioteki Boost, dotyczy tylko Windowsow:
#
boost_prefix = "C:\\Program Files (x86)\\boost_1_59_0"


libs = ["Generator"]

external_libs = []# ["python27"] humor: lib pythona to python27 pod windowsem, python2.7 pod linuxami...
libs_sources = map(lambda x: glob.glob('src/' + x + '/*.cpp'), libs)

program_sources = ['src/Main.cpp']
test_sources = Glob('test/*.cpp')

include_search_path = ['include'] + map(lambda x: 'src/' + x, libs)

app = ''
apptest = ''
libs_shared = ''

env = Environment(CPPPATH=include_search_path,LIBPATH=['.'])
env['SYSTEM'] = platform.system().lower()


if env['SYSTEM'] == 'windows':
    env.Append( CCFLAGS=["/EHsc"] )
    env.Append(CPPPATH=boost_prefix)
    env.Append(CPPPATH='C:\Python27\include')
    env.Append(LIBPATH=os.path.join(boost_prefix, 'stage\lib'))
    env.Append(LIBPATH='C:\Python27\libs')
    external_libs.append("python27")

elif env['SYSTEM'] == 'linux':
    env.Append(CXXFLAGS="-std=c++0x")
    env.Append(CPPPATH='/usr/include/python2.7')
    env.Append(LIBPATH='/usr/lib64/python2.7')
    external_libs.append("python2.7")
    external_libs.append("boost_python")
    env.Append( LINKFLAGS = Split('-z origin') )
    env.Append( RPATH = env.Literal(os.path.join('\\$$ORIGIN')))
 

#
# Czas konfiguracji.
#
conf = Configure(env)

if not conf.CheckCXXHeader('boost/test/included/unit_test.hpp'):
    print 'Boost.Test not found!'
    Exit(1)

env = conf.Finish()

#
# Kompilacja.
#

#Windows
if env['SYSTEM'] == 'windows':
    for i in range(len(libs)):
        libs_shared += env.StaticLibrary(libs[i], libs_sources[i])

if env['SYSTEM'] == 'linux':
    for i in range(len(libs)):
        libs_shared += env.SharedLibrary(libs[i], libs_sources[i])

testEnv = env.Clone()
#testEnv.Append(LIBPATH="src/")


#
# Targety
#

#Domyslny
app = env.Program("app", program_sources, LIBS=external_libs+libs)
env.Depends(app, libs_shared)

#Default(libs_shared)
Default(app)

#Testy
for i in range(len(libs)):
    apptest += testEnv.Program("test-" +libs[i]  , 'test/test_'+libs[i]+'.cpp', LIBS=external_libs+libs)

Alias('test', apptest)

#all
Alias('all', app)
Alias('all', apptest)
