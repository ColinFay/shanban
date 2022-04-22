HTMLWidgets.widget({

    name: 'shanban',

    type: 'output',

    factory: function(el, width, height) {
        var Kanban;
        let sendElToShiny = function() {
            let boards = {}
            document.getElementById(el.id).querySelectorAll('.kanban-board').forEach(el => {
                let items = []
                el.querySelectorAll('.kanban-item').forEach(i => {
                    items.push({
                        id: i.getAttribute('data-eid'),
                        title: i.innerHTML,
                    })
                })
                boards[
                    el.getAttribute('data-id')
                ] = {
                    id: el.getAttribute('data-id'),
                    title: el.querySelector('.kanban-title-board').innerHTML,
                    items,
                }
            })
            Shiny.setInputValue(
                el.id + "_content",
                boards
            )
        }

        let lastItemClicked = function(el) {
            Shiny.setInputValue(
                x.id + "_last_item_clicked",
                el.dataset.eid, { priority: "event" }
            )
        }

        let lastItemContexted = function(el) {
            Shiny.setInputValue(
                x.id + "_last_item_contexted",
                el.dataset.eid, { priority: "event" }
            )
        }

        let lastItemDragged = function(el) {
            Shiny.setInputValue(
                x.id + "_last_item_dragged",
                el.dataset.eid, { priority: "event" }
            )
        }

        return {
            renderValue: function(x) {
                el.widget = this;
                Kanban = new jKanban({
                    element: "#" + el.id,
                    gutter: x.gutter,
                    widthBoard: x.widthBoard,
                    responsivePercentage: x.responsivePercentage,
                    dragItems: x.dragItems,
                    boards: x.boards,
                    dragBoards: x.dragBoards,
                    itemAddOptions: x.itemAddOptions,
                    itemHandleOptions: x.itemHandleOptions,
                    click: function(el) {
                        lastItemClicked(el)
                        x.click(el)
                    },
                    context: function(el) {
                        lastItemContexted(el)
                        x.context(el)
                    },
                    dragEl: x.dragEl,
                    dragendEl: function(el) {
                        lastItemDragged(el);
                        sendElToShiny();
                        x.dragendEl(el)
                    },
                    dropEl: x.dropEl,
                    dragBoard: x.dragBoard,
                    dragendBoard: x.dragendBoard,
                    buttonClick: x.buttonClick,
                    propagationHandlers: x.propagationHandlers,
                })
                sendElToShiny()
            },

            resize: function(width, height) {

                // TODO: code to re-render the widget with a new size

            },
            kanban: () => Kanban,
            addBoard: (board) => Kanban.addBoards([board]),
            addElement: (boardId, element, position = undefined) => Kanban.addElement(boardId, element, position),
            addForm: (boardId, formItem) => Kanban.addForm(boardId, formItem),
            findBoard: (id) => Kanban.findBoard(id),
            findElement: (id) => Kanban.findElement(id),
            getParentBoardID: (id) => Kanban.getParentBoardID(id),
            replaceElement: (id, element) => Kanban.replaceElement(id, element),
            removeBoard: (boardId) => Kanban.removeBoard(boardId),
            removeElement: (id) => Kanban.removeElement(id),
            sendElToShiny: sendElToShiny
        };
    }
});

if (HTMLWidgets.shinyMode) {
    Shiny.addCustomMessageHandler(
        'kanban:removeBoard',
        function({ inputId, boardId }) {
            let el = document.getElementById(inputId)
            if (el.widget) {
                el.widget.removeBoard(boardId)
            }
        });
    Shiny.addCustomMessageHandler(
        'kanban:addBoard',
        function({ inputId, boardId }) {
            let el = document.getElementById(inputId)
            if (el.widget) {
                el.widget.addBoard(boardId)
            }
        })
    Shiny.addCustomMessageHandler(
        'kanban:addElement',
        function({ inputId, boardId, element, position }) {
            let el = document.getElementById(inputId)
            if (el.widget) {
                el.widget.addElement(boardId, element, position)
            }
        })
}