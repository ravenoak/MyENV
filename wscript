from glob import glob
import os

APPNAME = 'MyENV'
VERSION = '0.1'

def options(ctx):
    ctx.add_option('--prefix',
                   action='store',
                   default=os.environ.get('HOME'),
                   help='Install prefix. Defaults to ${HOME}')
    ctx.add_option('--no-configs',
                   action='store_true',
                   default=False,
                   help="Don't install config files")

def configure(ctx):
    ctx.env.PREFIX = ctx.options.prefix

def dist(ctx):
    ctx.excl = '**/.waf-1* \
                **/*~ \
                **/*.pyc \
                **/*.swp \
                **/.lock-w* \
                **/.project \
                **/.todo \
                **/.pydevproject \
                **/.git* \
                build \
                '
    
def build(bld):
    bashrcd_files = glob('src/bashrc.d/*.rc*')
    lib_files = glob('src/lib/*.sh')
    etc_files = glob('src/etc/*')
    nanorcd_files = glob('src/nanorc.d/*.nanorc')
    vim_ftplugin_files = glob('src/vim/ftplugin/*.vim')
    vim_syntax_files = glob('src/vim/syntax/*.vim')
    
    bld.install_as('${PREFIX}/.bash_profile', 'src/bash_profile')
    bld.install_as('${PREFIX}/.bashrc', 'src/bashrc')
    bld.install_as('${PREFIX}/.dir_colors', 'src/dir_colors')
    bld.install_as('${PREFIX}/.nanorc', 'src/nanorc')
    bld.install_as('${PREFIX}/.vimrc', 'src/vimrc')
    
    bld.install_files('${PREFIX}/.bashrc.d', bashrcd_files)
    bld.install_files('${PREFIX}/.lib', lib_files)
    bld.install_files('${PREFIX}/.nanorc.d', nanorcd_files)
    bld.install_files('${PREFIX}/.vim/ftplugin', vim_ftplugin_files)
    bld.install_files('${PREFIX}/.vim/syntax', vim_syntax_files)
    if bld.options.no_configs != True:
        bld.install_files('${PREFIX}/.etc', etc_files)
