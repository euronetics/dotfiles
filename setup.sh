
#!/bin/sh

INSTALL_FILES=(\
  vimrc \
  vim \
  zshrc \
  zsh \
)

SCRIPT=$(readlink -f $0)
SOURCE_DIR=$(dirname $SCRIPT)

for FILE in ${INSTALL_FILES[@]}
do
  if [[ -e "${HOME}/.${FILE}" ]]
  then
    echo "${HOME}/.${FILE} already exists"
  else
    /bin/ln -s "${SOURCE_DIR}/${FILE}" "${HOME}/.${FILE}"
  fi
done