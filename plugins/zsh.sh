#!/bin/sh


echo "--------------------------------------------------------"
echo "  Installing/Updating Zsh plugins"
echo "--------------------------------------------------------"

if ! command -v starship &> /dev/null; then
    echo "Starship not found. Starting installation."
    curl -sS https://starship.rs/install.sh | sh
else
    echo "Starship already installed, skipping"
fi


# Check if Oh My Zsh is already installed.
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh not found. Installing..."
    # Use the official installation script.
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Oh My Zsh is already installed. Skipping installation."
fi

# Now, install a popular plugin. We'll use zsh-autosuggestions as an example.
# We'll check if the directory already exists to avoid re-cloning.
echo ""
echo "Installing zsh-autosuggestions..."
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
    echo "zsh-autosuggestions installed successfully."
else
    echo "zsh-autosuggestions is already installed. Skipping."
fi

echo ""
echo "Zsh plugins setup complete."

