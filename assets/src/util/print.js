/**
 * Prints the given node in a new window
 * @param {Node} node DOM node to print
 */
export default function(node) {
  const printWindow = window.open('', 'PRINT')
  printWindow.document.write(
    `<html>
      <head></head>
      <body>
      </body>
    </html>
    `
  )
  setTimeout(() => {
    const printContent = printWindow.document.importNode(node, true)
    synchronizeStyles(node, printContent, true)
    printWindow.document.body.appendChild(printContent)
    printWindow.print()
    printWindow.close()
  }, 100)
}

/**
 * synchronizeStyles
 * Copies the computed styles from the src to the dest nodes
 * If recursively is set to true, both src and dest elements should
 * have the same shape
 * @param {Node} src Source element to copy the styles from
 * @param {Node} dest Destination element to copy the styles to
 * @param {Boolean} recursively
 */
function synchronizeStyles(src, dest, recursively) {
  dest.style.cssText = document.defaultView.getComputedStyle(src, '').cssText

  if (recursively) {
    const srcChildren = src.children
    const destChildren = dest.children

    for (var i = srcChildren.length; i--; ) {
      const srcElem = srcChildren[i]
      const destElem = destChildren[i]
      synchronizeStyles(srcElem, destElem, true)
    }
  }
}
