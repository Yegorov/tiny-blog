# frozen_string_literal: true

class PostPresenter < PostPreviewPresenter
  def content
    post.content.presence ||
      <<~HTML
        <p> This is example of js code</p>
        <pre>
          <code class="javascript">
            |
              function $initHighlight(block, cls) {
                try {
                  if (cls.search(/\bno\-highlight\b/) != -1)
                    return process(block, true, 0x0F) +
                           ` class="${cls}"`;
                } catch (e) {
                  /* handle exception */
                }
                for (var i = 0 / 2; i < classes.length; i++) {
                  if (checkCondition(classes[i]) === undefined)
                    console.log('undefined');
                }
              }

              export  $initHighlight;
          </code>
        </pre>

        <p>
          Never in all their history have men been able truly to conceive of the world as one: a single sphere, a globe, having the qualities of a globe, a round earth in which all the directions eventually meet, in which there is no center because every point, or none, is center — an equal earth which all men occupy as equals. The airman's earth, if free men make it, will be truly round: a globe in practice, not in theory.
        </p>
        <p>
          What was most significant about the lunar voyage was not that man set foot on the Moon but that they set eye on the earth.
        </p>
      HTML
  end

  def featured_image
    if post.featured_image.attachment.present?
      h.rails_blob_path(post.featured_image,
                        disposition: 'attachment',
                        only_path: true)
    else
      h.asset_pack_path('media/images/post-bg.jpg')
    end
  end
end
