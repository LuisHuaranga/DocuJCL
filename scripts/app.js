document.addEventListener('DOMContentLoaded', function() {
    const menuItems = document.querySelectorAll('.menu-item');
    const contentArea = document.getElementById('content');

    menuItems.forEach(item => {
        item.addEventListener('click', function() {
            const fileName = this.getAttribute('data-file');
            loadMarkdown(fileName);
        });
    });

    function loadMarkdown(fileName) {
        fetch(`docs/jcl/${fileName}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.text();
            })
            .then(data => {
                contentArea.innerHTML = marked.parse(data);
                addCopyButtons();
            })
            .catch(error => {
                console.error('There was a problem with the fetch operation:', error);
            });
    }

    function addCopyButtons() {
        const codeBlocks = document.querySelectorAll('pre code');
        codeBlocks.forEach(block => {
            const button = document.createElement('button');
            button.className = 'copy-button';
            button.textContent = 'Copiar';
            block.parentNode.insertBefore(button, block);

            const clipboard = new ClipboardJS(button, {
                target: () => block
            });

            clipboard.on('success', () => {
                button.textContent = 'Copiado!';
                setTimeout(() => {
                    button.textContent = 'Copiar';
                }, 2000);
            });

            clipboard.on('error', () => {
                button.textContent = 'Error';
            });
        });
    }
});

